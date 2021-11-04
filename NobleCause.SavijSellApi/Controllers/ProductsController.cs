using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using NobleCause.SavijSellApi.Services;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Controllers
{
    [Route("api/[controller]")] // https://<site>:<port>/api/Products
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IProductsService _productsService;

        public ProductsController(IProductsService productsService)
        {
            _productsService = productsService;
        }

        [HttpGet]
        [Authorize]
        public async Task<IActionResult> Get()
        {           
            var products = await _productsService.GetProducts();
            return Ok(products);
        }

        [HttpGet]
        [Route("{id}")]
        [Authorize]
        public async Task<IActionResult> GetProduct(string id)
        {
            var product = await _productsService.GetProduct(id);
            return Ok(product);
        }
    }
}
