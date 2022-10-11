using NobleCause.SavijSellApi.Models.Api;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Services
{
    public interface IAuthenticationService
    {
        Task<TokenResponse> RequestTokenAsync(TokenRequest tokenRequest);
        Task<TokenResponse> RefreshTokenAsync(RefreshTokenRequest refreshTokenRequest);
    }
}
