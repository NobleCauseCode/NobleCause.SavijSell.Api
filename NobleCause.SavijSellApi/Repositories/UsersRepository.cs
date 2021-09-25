using Dapper;
using NobleCause.SavijSellApi.Models.Api;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Repositories
{
    public class UsersRepository : IUsersRepository
    {
        public async Task InsertUserAsync(UserSignUp user)
        {
            try
            {
                using (var connection = new SqlConnection("server=localhost;database=savijsell;trusted_connection=true"))
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
