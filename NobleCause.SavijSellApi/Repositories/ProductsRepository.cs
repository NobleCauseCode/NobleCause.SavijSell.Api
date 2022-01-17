using NobleCause.SavijSellApi.Models.Api;
using System;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;
using System.Data;
using NobleCause.SavijSellApi.Models.Domain;
using System.Threading.Tasks;
using NobleCause.SavijSellApi.Models;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Logging;

namespace NobleCause.SavijSellApi.Repositories
{
    public class ProductsRepository : IProductsRepository
    {
        private readonly DatabaseSettings _databaseSettings;
        private readonly ILogger _logger;
        public ProductsRepository(
            IOptions<DatabaseSettings> databaseSettings,
            ILogger<ProductsRepository> logger
            )

        {
            _databaseSettings = databaseSettings.Value;
            _logger = logger;
        }

        public async Task<Product> GetProduct(string id)
        {
            try
            {
                var idNumber = Convert.ToInt32(id);
                var products = await GetProducts();
                // uncomment to show example of exception logging
                // throw new Exception("DATABASE WENT HOME!");
                var product = products.Where(p => p.Id == idNumber).FirstOrDefault();
                _logger.LogDebug($"Product {idNumber} is {product.Title}");
                return product;
            }
            catch (Exception ex)
            {
                _logger.LogError("DUUUUDE!!!!!!", ex);
                throw;
            }
            
        }

        public async Task<List<Product>> GetProducts()
        {
            try
            {
                using (var connection = new SqlConnection(_databaseSettings.ConnectionString))
                {
                    var results = await connection.QueryAsync<Product>("stp_Items_Get",
                             null, commandType: CommandType.StoredProcedure);

                    if (results != null)
                    {
                        return results.ToList();
                    }
                    return null;
                }
            }
            catch (Exception ex)
            {
                // logging
                throw;
            }
        }
    }
}
