using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Models.Domain;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Repositories
{
    public interface IUsersRepository
    {
        Task InsertUserAsync(UserSignUp user);
        Task<User> GetUserByEmailAsync(string email);
    }
}
