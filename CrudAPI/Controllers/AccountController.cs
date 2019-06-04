using CrudAPI.Models;
using CrudAPI.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace CrudAPI.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    //[Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IAccountService _accountService;
        private readonly ITokenManager _tokenManager;
        public AccountController(
            IAccountService accountService,
            ITokenManager tokenManager
            )
        {
            _accountService = accountService;
            _tokenManager = tokenManager;
        }


        [HttpGet("account")]
        public IActionResult Get([FromBody] SignUp request)
        => Content($"Hello {User.Identity.Name}");


        [HttpPost("sign-up")]
        [AllowAnonymous]
        public IActionResult SignUp([FromBody] SignUp request)
        {
            _accountService.SignUp(request.Username, request.Password);

            return NoContent();
        }
        [HttpPost("sign-in")]
        [AllowAnonymous]
        public IActionResult SignIn([FromBody] SignIn request)
         => Ok(_accountService.SignIn(request.Username, request.Password));

        [HttpPost("tokens/{token}/refresh")]
        [AllowAnonymous]
        public IActionResult RefreshAccessToken(string token)
           => Ok(_accountService.RefreshAccessTokenAsync(token));

        [HttpPost("tokens/cancel")]
        public async Task<IActionResult> CancelAccessToken()
        {
            await _accountService.DeactivateCurrentAsync(User.Identity.Name);

            return NoContent();
        }
        [AllowAnonymous]
        [HttpPost("tokens/cancel/{userid}")]
        public async Task<IActionResult> CancelAccessToken(string userid)
        {
            await _accountService.DeactivateCurrentByIdAsync(userid);

            return NoContent();
        }
    }
}