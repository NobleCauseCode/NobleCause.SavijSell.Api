using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using NobleCause.SavijSellApi.Data;
using NobleCause.SavijSellApi.Models;
using NobleCause.SavijSellApi.Models.Api;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Authentication;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Services
{
    public class AuthenticationService : IAuthenticationService
    {
        private readonly IUsersService _usersService;
        private readonly CryptoSettings _cryptoSettings;
        private readonly ITokenStore _tokenStore;
        public AuthenticationService(
            IUsersService usersService,
            IOptions<CryptoSettings> cryptoSettings, ITokenStore tokenStore)
        {
            _usersService = usersService;
            _cryptoSettings = cryptoSettings.Value;
            _tokenStore = tokenStore;
        }

        public async Task<TokenResponse> RefreshTokenAsync(RefreshTokenRequest refreshTokenRequest)
        {
            // validate refresh token
            var isValid = ValidateRefreshToken(refreshTokenRequest);
            if(isValid)
            {
                // get user
                var user = await _usersService.GetUserFromRefreshTokenAsync(
                                                    refreshTokenRequest.Email,
                                                    refreshTokenRequest.RefreshToken);

                if(user != null)
                {
                    return CreateToken(user);
                }

            }
            else
            {
                throw new SecurityTokenExpiredException();
            }
            throw new AuthenticationException();
        }

        private bool ValidateRefreshToken(RefreshTokenRequest refreshTokenRequest)
        {
            var storedToken = _tokenStore.GetToken(refreshTokenRequest.Email,
                                                   refreshTokenRequest.RefreshToken);
            if(storedToken != null)
            {
                if(storedToken.RefreshExpirationDate < DateTime.Now)
                {
                    return false;
                }

                if(storedToken.RefreshToken != refreshTokenRequest.RefreshToken)
                {
                    return false;
                }
                return true;
            }
            return false;
        }

        public async Task<TokenResponse> RequestTokenAsync(TokenRequest tokenRequest)
        {
            var user = await _usersService.LoginUserAsync(tokenRequest);
            if (user != null)
            {
                return CreateToken(user);
            }

            throw new AuthenticationException();
        }

        private TokenResponse CreateToken(Models.Domain.User user)
        {
            var claim = new List<Claim>
                {
                    new Claim(JwtRegisteredClaimNames.Sub, user.UserId.ToString()),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    new Claim(ClaimTypes.Name, user.UserName),
                    new Claim(ClaimTypes.Email, user.Email)
                };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_cryptoSettings.JwtSigningKey));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken
            (
                issuer: "localhost:44328",
                audience: "localhost:44328",
                claims: claim,
                expires: DateTime.Now.AddSeconds(20),
                signingCredentials: creds
            );

            var tokenResponse = new TokenResponse
            {
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                RefreshToken = GenerateRefreshToken()
            };

            _tokenStore.AddToken(user.Email, new Token
            { 
                AccessToken = tokenResponse.Token,
                RefreshToken = tokenResponse.RefreshToken,
                Email = user.Email,
                RefreshExpirationDate = DateTime.Now.AddDays(10)
            });

            return tokenResponse;
        }

        private string GenerateRefreshToken()
        {
            var buffer = new byte[64];
            using(var randomNumberGenerator = RandomNumberGenerator.Create())
            {
                randomNumberGenerator.GetBytes(buffer);
                return Convert.ToBase64String(buffer);
            }
        }
    }
}
