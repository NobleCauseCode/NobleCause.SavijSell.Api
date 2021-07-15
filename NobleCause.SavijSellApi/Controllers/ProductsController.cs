using Microsoft.AspNetCore.Mvc;
using NobleCause.SavijSellApi.Services;

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
        public IActionResult Get()
        {           
            var products = _productsService.GetProducts();
            return Ok(products);
        }
    }
}
