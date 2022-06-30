using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using NobleCause.SavijSellApi.Models;
using System.Net;
using System.Threading.Tasks;

namespace NobleCause.SavijSellApi.Middleware
{
    public class UseApiKey
    {
        private readonly RequestDelegate _next;
        private readonly AdminSettings _adminSettings;

        public UseApiKey(RequestDelegate next, IOptions<AdminSettings> adminSettings)
        {
            _next = next;
            _adminSettings = adminSettings.Value;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            if(context.Request.Path.Value.ToLowerInvariant().Contains("admin"))
            {
                if(context.Request.Headers.ContainsKey("x-api-key"))
                {
                    // has admin & api key header
                    if(!_adminSettings.ApiKeys.Contains(context.Request.Headers["x-api-key"]))
                    {
                        context.Response.StatusCode = (int)HttpStatusCode.NotFound;
                        context.Response.ContentType = "text/plain";
                        await context.Response.WriteAsync("Not Found");
                        await context.Response.CompleteAsync();
                    }
                }
                else
                {
                    // has admin, but no api-key header
                    context.Response.StatusCode = (int)HttpStatusCode.NotFound;
                    context.Response.ContentType = "text/plain";
                    await context.Response.WriteAsync("Not Found");
                    await context.Response.CompleteAsync();

                }
            }
            await _next(context);

        }
    }
}
