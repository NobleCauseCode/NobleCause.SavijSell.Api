using NobleCause.SavijSellApi.Data;
using FluentEmail.Core;
using FluentEmail.Mailgun;
using Microsoft.Extensions.Options;
using NobleCause.SavijSellApi.Helpers;
using NobleCause.SavijSellApi.Models;
using NobleCause.SavijSellApi.Models.Api;
using NobleCause.SavijSellApi.Models.Domain;
using NobleCause.SavijSellApi.Repositories;
using System;
using System.Security.Authentication;
using System.Threading.Tasks;


namespace NobleCause.SavijSellApi.Services
{
    public class UsersService : IUsersService
    {
        private readonly IUsersRepository _usersRespository;
        private readonly MailGunSettings _mailGunSettings;
        private readonly ITokenStore _tokenStore;
        public UsersService(IUsersRepository usersRespository, ITokenStore tokenStore
                            IOptions<MailGunSettings> mailGunSettings)
        {
            _usersRespository = usersRespository;
            _tokenStore = tokenStore;
            _mailGunSettings = mailGunSettings.Value;
        }

        public async Task InsertUserAsync(UserSignUp user)
        {
            user.Password = Crypto.HashPassword(user.Password);
            var userId = await _usersRespository.InsertUserAsync(user);
            // create a validationdata
            var verificationData = Guid.NewGuid();
            // update the database with validationdata
            await _usersRespository.UpdateUserValidationData(userId, verificationData);
            // send email with link to a page that accepts the valdata
            await SendEmail(verificationData.ToString());
        }

        private async Task SendEmail(string verficationData)
        {
            var sender = new MailgunSender(
                "sandbox655770c03c374ad8a92dbe3519b714fe.mailgun.org", // Mailgun Domain
                _mailGunSettings.ApiKey // Mailgun API Key

            );
            Email.DefaultSender = sender;
            var email = Email
                        .From("verification@savijsell.com")
                        .To("cartmansavij@sharklasers.com")
                        .Subject("Please click the link")
                        .Body($"<a href=\"https://localhost:44350/verifyemail/{verficationData}\">Click to verify</a>");

            var response = await email.SendAsync();
        }

        public async Task<User> LoginUserAsync(TokenRequest login)
        {
            var user = await _usersRespository.GetUserByEmailAsync(login.Email);

            if (user == null)
            {
                throw new AuthenticationException();
            }

            var isValid = Crypto.VerifyHashedPassword(user.Password, login.Password);

            if (!isValid)
            {
                throw new AuthenticationException();
            }

            return user;
        }

		public async Task<User> GetUserFromRefreshTokenAsync(string email, string refreshToken)
        {
            var user = await _usersRespository.GetUserByEmailAsync(email);
            if (user == null)
            {
                throw new AuthenticationException();
            }
            if(_tokenStore.GetToken(email,refreshToken) != null)
            {
                return user;
            }

            return null;
        }
        
        public async Task<int> GetUserIdByVerification(string verificationData)
        {
            return await _usersRespository.GetUserIdByVerification(verificationData);
        }
    }
}
