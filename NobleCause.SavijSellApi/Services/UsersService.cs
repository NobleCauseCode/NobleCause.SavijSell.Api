using NobleCause.SavijSellApi.Data;
using NobleCause.SavijSellApi.Helpers;
using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Models.Domain;
using NobleCause.SavijSellApi.Repositories;
using System.Security.Authentication;
using System.Threading.Tasks;


namespace NobleCause.SavijSellApi.Services
{
    public class UsersService : IUsersService
    {
        private readonly IUsersRepository _usersRespository;
        private readonly ITokenStore _tokenStore;
        public UsersService(IUsersRepository usersRespository, ITokenStore tokenStore)
        {
            _usersRespository = usersRespository;
            _tokenStore = tokenStore;
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

        public async Task<User> GetUserFromRefreshTokenAsync(string email, string refreshToken)
        {
            var user = await _usersRespository.GetUserByEmailAsync(email);
            if (user == null)
            {
                throw new AuthenticationException();
            }
            if(_tokenStore.GetToken(email,refreshToken) != null)
            {
                return user;
            }

            return null;
        }

    }
}
