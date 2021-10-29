using NobleCause.SavijSellApi.Models.Api;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Services
{
    public interface IProductsService
    {
        Task<List<Product>> GetProducts();
        Task<Product> GetProduct(string id);
    }
}
