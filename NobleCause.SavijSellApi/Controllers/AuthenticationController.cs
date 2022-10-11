using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Services;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Controllers
{ 
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly IAuthenticationService _authenticationService;

        public AuthenticationController(IAuthenticationService authenticationService)
        {
            _authenticationService = authenticationService;
        }

        [HttpPost]
        [Route("/api/token")]
        [AllowAnonymous]
        public async Task<IActionResult> RequestToken(TokenRequest tokenRequest)
        {
            var token = await _authenticationService.RequestTokenAsync(tokenRequest);
            return Ok(token);
        }

        [HttpPost]
        [Route("/api/refreshToken")]
        [AllowAnonymous]
        public async Task<IActionResult> RefreshToken(RefreshTokenRequest refreshTokenRequest)
        {
            var token = await _authenticationService.RefreshTokenAsync(refreshTokenRequest);
            return Ok(token);
        }

    }
}
