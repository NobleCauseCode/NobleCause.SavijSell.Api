using NobleCause.SavijSellApi.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Repositories
{
    public interface IProductsRepository
    {
        public List<Product> GetProducts();
    }
}
