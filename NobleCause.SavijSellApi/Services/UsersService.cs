using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Repositories;
using System.Threading.Tasks;
using System.Web.Helpers;

namespace NobleCause.SavijSellApi.Services
{
    public class UsersService: IUsersService
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

        public async Task<string> LoginUserAsync(UserLogin login)
        {
            // try to get a user from the repo (db)
            var user = await _usersRespository.GetUserByEmailAsync(login.Email);
            // if I get one, check the password
            if(user == null)
            {
                return string.Empty;
            }
            var isValid = Crypto.VerifyHashedPassword(user.Password, login.Password);
            // if the password is good, get a token
            if(isValid)
            {
                // get a token
            }
            return string.Empty;
        }
    }
}
