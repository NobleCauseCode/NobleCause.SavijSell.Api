using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Models.Domain;
using System;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Repositories
{
    public interface IUsersRepository
    {
        Task<int> InsertUserAsync(UserSignUp user);
        Task<User> GetUserByEmailAsync(string email);
        Task UpdateUserValidationData(int userId, Guid verificationData);
        Task<int> GetUserIdByVerification(string verificationData);
    }
}
