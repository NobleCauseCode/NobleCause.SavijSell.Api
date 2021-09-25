using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Repositories;
using System.Threading.Tasks;

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
            await _usersRespository.InsertUserAsync(user);
        }
    }
}
