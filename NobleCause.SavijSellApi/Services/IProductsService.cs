using NobleCause.SavijSellApi.Models.Api;
using System.Collections.Generic;

namespace NobleCause.SavijSellApi.Services
{
    public interface IProductsService
    {
        public List<Product> GetProducts();
    }
}
