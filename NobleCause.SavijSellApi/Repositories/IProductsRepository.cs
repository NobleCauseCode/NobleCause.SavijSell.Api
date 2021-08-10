using NobleCause.SavijSellApi.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Repositories
{
    public interface IProductsRepository
    {
        List<Product> GetProducts();
        Product GetProduct(string id);
    }
}
