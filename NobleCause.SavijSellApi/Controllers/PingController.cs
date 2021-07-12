using Microsoft.AspNetCore.Mvc;
using NobleCause.SavijSellApi.Models;

namespace NobleCause.SavijSellApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PingController : ControllerBase
    {
        [HttpGet]
        [Route("/ping")]
        public IActionResult Get()
        {
            return Ok(new { Response = "Pong" });
        }
    }
}
