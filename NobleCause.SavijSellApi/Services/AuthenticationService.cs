using Microsoft.IdentityModel.Tokens;
using NobleCause.SavijSellApi.Models.Api;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Authentication;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Services
{
    public class AuthenticationService : IAuthenticationService
    {
        private readonly IUsersService _usersService;
        // ToDo: REMOVE THIS KEY!! FOR TUTORIAL PURPOSES ONLY!!!!!
        private const string JwtSigningKey = "iub1i5Np0EP0YC1EFqIEsOwrIkOAmzpj9XWPaaI+Qkw=";

        public AuthenticationService(IUsersService usersService)
        {
            _usersService = usersService;
        }

        public async Task<TokenResponse> RequestTokenAsync(TokenRequest tokenRequest)
        {
            var user = await _usersService.LoginUserAsync(tokenRequest);
            if (user != null)
            {
                var claim = new List<Claim> 
                {
                    new Claim(JwtRegisteredClaimNames.Sub, user.UserId.ToString()),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    new Claim(ClaimTypes.Name, user.UserName),
                    new Claim(ClaimTypes.Email, user.Email)
                };

                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(JwtSigningKey));
                var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                var token = new JwtSecurityToken
                (
                    issuer: "localhost:44328",
                    audience: "localhost:44328",
                    claims: claim,
                    expires: DateTime.Now.AddMinutes(30),
                    signingCredentials: creds
                );

                return new TokenResponse
                {
                    Token = new JwtSecurityTokenHandler().WriteToken(token)
                };
            }

            throw new AuthenticationException();
        }
    }
}
