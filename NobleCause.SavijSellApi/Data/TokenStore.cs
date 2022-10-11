using System.Collections.Generic;

namespace NobleCause.SavijSellApi.Data
{
    public class TokenStore: ITokenStore
    {
        public Dictionary<string,Token> Tokens { get; }
        public TokenStore()
        {
            Tokens = new Dictionary<string, Token>();
        }

        public void AddToken(string email, Token token)
        {
            if(Tokens.ContainsKey(email))
            {
                Tokens[email] = token;
            }
            else
            {
                Tokens.Add(email, token);
            }
        }

        public Token GetToken(string email, string refreshToken)
        {
            if (Tokens.ContainsKey(email) && Tokens[email].RefreshToken == refreshToken)
            {
                return Tokens[email];
            }
            return null;
        }


    }
}
