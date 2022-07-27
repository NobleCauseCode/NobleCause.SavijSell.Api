using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Models.Domain;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Services
{
    public interface IUsersService
    {
        Task InsertUserAsync(UserSignUp user);
        Task<User> LoginUserAsync(TokenRequest login);
        Task<int> GetUserIdByVerification(string verificationData);
    }
}
