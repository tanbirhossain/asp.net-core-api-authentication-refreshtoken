using CrudAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Primitives;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace CrudAPI.Services
{

    public interface ITokenManager
    {
        Task<bool> IsCurrentActiveToken();
        Task DeactivateCurrentAsync();
        Task<bool> IsActiveAsync(string token);
        Task DeactivateAsync(string token);
        string GetCurrentAsync();


    }
    public class TokenManager : ITokenManager
    {
        private readonly IDistributedCache _cache;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IOptions<JwtOptions> _jwtOptions;
        //private readonly IAccountService _accountService;

        public TokenManager(IDistributedCache cache,

            IHttpContextAccessor httpContextAccessor,
            IOptions<JwtOptions> jwtOptions
          )
        {
            _cache = cache;

            _httpContextAccessor = httpContextAccessor;
            _jwtOptions = jwtOptions;
        }


        public async Task<bool> IsCurrentActiveToken()
       => await IsActiveAsync(GetCurrentAsync());

        public async Task DeactivateCurrentAsync()
        {
            //var result = _accountService.CompleteAccessRefreshByUserId(Convert.ToInt32(_httpContextAccessor.HttpContext.User.Identity.Name));
            await DeactivateAsync(GetCurrentAsync());
        }


        public async Task<bool> IsActiveAsync(string token)
        {
            var key = GetKey(token);
            var result = await _cache.GetStringAsync(key);

            return result == null;
        }


        public async Task DeactivateAsync(string token)
            => await _cache.SetStringAsync(GetKey(token),
                " ", new DistributedCacheEntryOptions
                {
                    AbsoluteExpirationRelativeToNow =
                        TimeSpan.FromMinutes(_jwtOptions.Value.ExpiryMinutes)
                });

        public string GetCurrentAsync()
        {
            var authorizationHeader = _httpContextAccessor
                .HttpContext.Request.Headers["authorization"];

            return authorizationHeader == StringValues.Empty
                ? string.Empty
                : authorizationHeader.Single().Split(" ").Last();
        }

        private static string GetKey(string token)
            => $"tokens:{token}:deactivated";
    }
}
