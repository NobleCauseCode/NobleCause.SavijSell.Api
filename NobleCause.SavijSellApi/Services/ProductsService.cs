using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Repositories;
using System.Collections.Generic;

namespace NobleCause.SavijSellApi.Services
{
    public class ProductsService : IProductsService
    {
        private readonly IProductsRepository _productsRepository;

        public ProductsService(IProductsRepository productsRepository)
        {
            _productsRepository = productsRepository;
        }

        public List<Product> GetProducts()
        {
            return _productsRepository.GetProducts();
        }
    }
}
