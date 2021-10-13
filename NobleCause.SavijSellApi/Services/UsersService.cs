using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Models.Domain;
using NobleCause.SavijSellApi.Repositories;
using System.Security.Authentication;
using System.Threading.Tasks;
using System.Web.Helpers;

namespace NobleCause.SavijSellApi.Services
{
    public class UsersService : IUsersService
    {
        private readonly IUsersRepository _usersRespository;

        public UsersService(IUsersRepository usersRespository)
        {
            _usersRespository = usersRespository;
        }

        public async Task InsertUserAsync(UserSignUp user)
        {
            user.Password = Crypto.HashPassword(user.Password);
            await _usersRespository.InsertUserAsync(user);
        }

        public async Task<User> LoginUserAsync(TokenRequest login)
        {
            var user = await _usersRespository.GetUserByEmailAsync(login.Email);

            if (user == null)
            {
                throw new AuthenticationException();
            }

            var isValid = Crypto.VerifyHashedPassword(user.Password, login.Password);

            if (!isValid)
            {
                throw new AuthenticationException();
            }

            return user;
        }
    }
}
