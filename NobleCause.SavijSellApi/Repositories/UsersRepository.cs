using Dapper;
using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Models.Domain;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Linq;
using NobleCause.SavijSellApi.Models;
using Microsoft.Extensions.Options;

namespace NobleCause.SavijSellApi.Repositories
{
    public class UsersRepository : IUsersRepository
    {
        private readonly DatabaseSettings _databaseSettings;

        public UsersRepository(IOptions<DatabaseSettings> databaseSettings)
        {
            _databaseSettings = databaseSettings.Value;
        }

        public async Task<User> GetUserByEmailAsync(string email)
        {
            try
            {
                using (var connection = new SqlConnection(_databaseSettings.ConnectionString))
                {
                    var parameters = new DynamicParameters();       
                    parameters.Add("@Email", email);
                    
                   var results = await connection.QueryAsync<User>("stp_Users_GetByEmail", 
                            parameters, commandType: CommandType.StoredProcedure);

                    if(results != null)
                    {
                        return results.FirstOrDefault();
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

        public async Task InsertUserAsync(UserSignUp user)
        {
            try
            {
                using (var connection = new SqlConnection(_databaseSettings.ConnectionString))
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("@FirstName", user.FirstName);
                    parameters.Add("@LastName", user.LastName);
                    parameters.Add("@Email", user.Email);
                    parameters.Add("@Password", user.Password);
                    parameters.Add("@PostalCode", user.PostalCode);
                    parameters.Add("@UserName", user.UserName);
                    await connection.ExecuteAsync("stp_Users_Insert", parameters,
                        commandType: CommandType.StoredProcedure);
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
