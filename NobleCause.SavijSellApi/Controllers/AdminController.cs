using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace NobleCause.SavijSellApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok("Admin Was Called!");
        }
    }
}
