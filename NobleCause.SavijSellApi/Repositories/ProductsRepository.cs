using NobleCause.SavijSellApi.Models.Api;
using System;
using System.Linq;
using System.Collections.Generic;

namespace NobleCause.SavijSellApi.Repositories
{
    public class ProductsRepository : IProductsRepository
    {
        public Product GetProduct(string id)
        {
            var idNumber = Convert.ToInt32(id);
            var products = GetProducts();

            return products.Where(p => p.Id == idNumber).FirstOrDefault();
        }

        public List<Product> GetProducts()
        {
            var products = new List<Product>();
            return products;
        }
    }
}
