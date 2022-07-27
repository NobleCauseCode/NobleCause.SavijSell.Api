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

        public async Task<int> GetUserIdByVerification(string verificationData)
        {
            try
            {
                using (var connection = new SqlConnection(_databaseSettings.ConnectionString))
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("@VerificationData", verificationData);

                    var results = await connection.QueryAsync<int?>("stp_Users_GetByVerification",
                             parameters, commandType: CommandType.StoredProcedure);

                    if (results != null)
                    {
                        return results.FirstOrDefault() ?? -1;
                    }
                    return -1;
                }
            }
            catch (Exception ex)
            {
                // logging
                throw;
            }
        }

        public async Task<int> InsertUserAsync(UserSignUp user)
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
                    parameters.Add("@UserId", dbType: DbType.Int32, direction: ParameterDirection.Output);
                    await connection.QueryAsync("stp_Users_Insert", parameters,
                        commandType: CommandType.StoredProcedure);
                    var userId = parameters.Get<int>("@UserId");
                    return userId;
                }
            }
            catch (Exception ex)
            {
                // logging
                throw;
            }

        }

        public async Task UpdateUserValidationData(int userId, Guid verificationData)
        {
            try
            {
                using (var connection = new SqlConnection(_databaseSettings.ConnectionString))
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("@UserId", userId);
                    parameters.Add("@VerificationData", verificationData.ToString());
                    
                    await connection.ExecuteAsync("stp_Users_UpdateVerification", parameters,
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
