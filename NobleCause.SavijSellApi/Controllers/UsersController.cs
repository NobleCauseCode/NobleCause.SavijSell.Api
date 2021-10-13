using Microsoft.AspNetCore.Mvc;
using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Services;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUsersService _usersService;

        public UsersController(IUsersService usersService)
        {
            _usersService = usersService;
        }

        [HttpPost]
        public async Task<IActionResult> Post(UserSignUp user)
        {
            await _usersService.InsertUserAsync(user);
            return NoContent();
        }
    }
}
