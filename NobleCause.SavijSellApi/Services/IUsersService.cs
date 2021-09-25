using NobleCause.SavijSellApi.Models.Api;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Services
{
    public interface IUsersService
    {
        Task InsertUserAsync(UserSignUp user);
    }
}
