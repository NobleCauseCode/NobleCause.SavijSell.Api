using NobleCause.SavijSellApi.Models.Api;
using System.Collections.Generic;

namespace NobleCause.SavijSellApi.Services
{
    public interface IProductsService
    {
        List<Product> GetProducts();
        Product GetProduct(string id);
    }
}
