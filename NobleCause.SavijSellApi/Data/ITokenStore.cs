using System.Collections.Generic;

namespace NobleCause.SavijSellApi.Data
{
    public interface ITokenStore
    {
        Dictionary<string, Token> Tokens { get; }
        void AddToken(string email, Token token);
        Token GetToken(string email, string refreshToken);
    }
}
