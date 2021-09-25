using NobleCause.SavijSellApi.Models.Api;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Repositories
{
    public interface IUsersRepository
    {
        Task InsertUserAsync(UserSignUp user);
    }
}
