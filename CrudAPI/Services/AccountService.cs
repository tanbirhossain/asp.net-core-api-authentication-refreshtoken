using CrudAPI.DB;
using CrudAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace CrudAPI.Services
{
    public interface IAccountService
    {
        void SignUp(string username, string password);

        JsonWebToken SignIn(string username, string password);
        Task<JsonWebToken> RefreshAccessTokenAsync(string token);
        void RevokeRefreshToken(string token);
        Task DeactivateCurrentAsync(string userId);
        Task DeactivateCurrentByIdAsync(string userId);
    }


    public class AccountService : IAccountService
    {
        private AngularCrudDBContext _db = new AngularCrudDBContext();
        private readonly IJwtHandler _jwtHandler;
        IPasswordHasher<User> _passwordHasher;
        private readonly ITokenManager _tokenManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public AccountService(
             IHttpContextAccessor httpContextAccessor,
            ITokenManager tokenManager,
            IJwtHandler jwtHandler,

            IPasswordHasher<User> passwordHasher
            )
        {
            //_db = db;
            _tokenManager = tokenManager;
            _jwtHandler = jwtHandler;
            _passwordHasher = passwordHasher;
            _httpContextAccessor = httpContextAccessor;
        }

        /// <summary>
        /// this is out side method
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>

        public async Task DeactivateCurrentByIdAsync(string userId)
        {
            var result = CompleteAccessRefreshByUserId(Convert.ToInt32(userId));
            await _tokenManager.DeactivateAsync(result.AccessToken);
        }

        public async Task DeactivateCurrentAsync(string userId)
        {
            var result = CompleteAccessRefreshByUserId(Convert.ToInt32(userId));
            await _tokenManager.DeactivateAsync(_tokenManager.GetCurrentAsync());
        }

        public void SignUp(string username, string password)
        {
            if (string.IsNullOrWhiteSpace(username))
            {
                throw new Exception($"Username can not be empty.");
            }
            if (string.IsNullOrWhiteSpace(password))
            {
                throw new Exception($"Password can not be empty.");
            }
            if (GetUser(username) != null)
            {
                throw new Exception($"Username '{username}' is already in use.");
            }
            _db.Add(new User { Username = username, Password = password });
            _db.SaveChanges();
        }


        public JsonWebToken SignIn(string username, string password)
        {
            var user = GetUser(username);
            if (user == null)
            {
                throw new Exception("Invalid credentials.");
            }
            if (user.Password != password)
            {
                throw new Exception("Wrong password.");
            }
            var jwt = _jwtHandler.Create(user.Id.ToString());
            var refreshToken = _passwordHasher.HashPassword(user, Guid.NewGuid().ToString())
            .Replace("+", string.Empty)
            .Replace("=", string.Empty)
            .Replace("/", string.Empty);
            jwt.RefreshToken = refreshToken;
            Task.Run(() => InsertAccessTokenDB(jwt, username));
            return jwt;
        }


        public async Task<JsonWebToken> RefreshAccessTokenAsync(string token)
        {
            var refreshToken = GetRefreshToken(token);
            if (refreshToken == null)
            {
                throw new Exception("Refresh token was not found.");
            }
            if (!refreshToken.IsActiveRefreshToken.Value)
            {
                throw new Exception("Refresh token was revoked");
            }
            await _tokenManager.DeactivateAsync(refreshToken.AccessToken);

            var jwt = _jwtHandler.Create(refreshToken.Id.ToString());
            jwt.RefreshToken = refreshToken.RefreshToken;
            await Task.Run(() => InsertAccessTokenDB(jwt, refreshToken.Username));
            return jwt;
        }

        public void RevokeRefreshToken(string token)
        {
            throw new System.NotImplementedException();
        }
        private User CompleteAccessRefreshByUserId(int id)
        {
            var result = _db.User.Where(x => x.Id == id).FirstOrDefault();
            result.IsActiveAccessToken = false;
            result.IsActiveRefreshToken = false;
            _db.SaveChangesAsync();
            return result;
        }



        private User GetUser(string username)
             => _db.User.Where(x => x.Username == username).FirstOrDefault();
        private User GetRefreshToken(string token)
        => _db.User.Where(x => x.RefreshToken == token).FirstOrDefault();

        private void InsertAccessTokenDB(JsonWebToken jwt, string username)
        {
            var user = _db.User.Where(x => x.Username == username).FirstOrDefault();
            user.AccessToken = jwt.AccessToken;
            user.IsActiveAccessToken = true;
            user.RefreshToken = jwt.RefreshToken;
            user.IsActiveRefreshToken = true;
            _db.SaveChanges();
        }

    }
}
