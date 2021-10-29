using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Services
{
    public class ProductsService : IProductsService
    {
        private readonly IProductsRepository _productsRepository;

        public ProductsService(IProductsRepository productsRepository)
        {
            _productsRepository = productsRepository;
        }

        public async Task<Product> GetProduct(string id)
        {
            return await _productsRepository.GetProduct(id);
        }

        public async Task<List<Product>> GetProducts()
        {
            return await _productsRepository.GetProducts();
        }
    }
}
