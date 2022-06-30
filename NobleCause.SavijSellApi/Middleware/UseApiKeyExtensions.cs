using Microsoft.AspNetCore.Builder;

namespace NobleCause.SavijSellApi.Middleware
{
    public static class UseApiKeyExtensions
    {
        public static IApplicationBuilder UseApiKey(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<UseApiKey>();
        }
    }
}
