using System;

namespace NobleCause.SavijSellApi.Data
{
    public class Token
    {
        public string Email { get; set; }
        public string AccessToken { get; set; }
        public string RefreshToken { get; set; }
        public DateTime RefreshExpirationDate { get; set; }
    }
}
