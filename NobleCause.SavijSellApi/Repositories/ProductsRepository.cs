using NobleCause.SavijSellApi.Models.Api;
using System;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;
using System.Data;
using NobleCause.SavijSellApi.Models.Domain;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Repositories
{
    public class ProductsRepository : IProductsRepository
    {
        public async Task<Product> GetProduct(string id)
        {
            var idNumber = Convert.ToInt32(id);
            var products = await GetProducts();

            return products.Where(p => p.Id == idNumber).FirstOrDefault();
        }

        public async Task<List<Product>> GetProducts()
        {
            try
            {
                using (var connection = new SqlConnection("server=localhost;database=savijsell;trusted_connection=true"))
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
