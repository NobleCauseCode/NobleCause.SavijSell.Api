using Loggly;
using Loggly.Config;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using NobleCause.SavijSellApi.Data;
using NobleCause.SavijSellApi.Models;
using NobleCause.SavijSellApi.Repositories;
using NobleCause.SavijSellApi.Services;
using Serilog;
using System;
using System.Text;

namespace NobleCause.SavijSellApi
{
    public class Startup
    {
        // ToDo: REMOVE THIS KEY!! FOR TUTORIAL PURPOSES ONLY!!!!!
        // private const string JwtSigningKey = "iub1i5Np0EP0YC1EFqIEsOwrIkOAmzpj9XWPaaI+Qkw=";
        private const string AllowedOrigins = "_allowedOrigins";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy(AllowedOrigins, policy =>
                {
                    policy.WithOrigins("http://localhost:3000");
                    policy.AllowAnyHeader();
                });

            });

            var dbSettingsSection = Configuration.GetSection("DatabaseSettings");
            services.Configure<DatabaseSettings>(dbSettingsSection);

            var cryptoSettingsSection = Configuration.GetSection("CryptoSettings");
            services.Configure<CryptoSettings>(cryptoSettingsSection);

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        ValidIssuer = "localhost:44328",
                        ValidAudience = "localhost:44328",
                        IssuerSigningKey = new SymmetricSecurityKey(
                                            Encoding.UTF8.GetBytes(cryptoSettingsSection["JwtSigningKey"])),
                        ClockSkew = TimeSpan.Zero
                    };
                });

            // Uncomment these 3 lines plus the WriteTo.Loggly() below. You will
            // have to change the CustomerToken value in appsettings to a valid one
            // as well.
            //var logglySettings = new LogglySettings();
            //Configuration.GetSection("Serilog:Loggly").Bind(logglySettings);

            // SetupLoggly(logglySettings);

            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug()
                .MinimumLevel.Override(Constants.Microsoft, Serilog.Events.LogEventLevel.Warning)
                .Enrich.FromLogContext()
                .WriteTo.Debug()
                .WriteTo.File("log.txt", rollingInterval: RollingInterval.Day)
                //.WriteTo.Loggly()
                .CreateLogger();

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "NobleCause.SavijSellApi", Version = "v1" });
            });

            services.AddSingleton<IProductsService, ProductsService>();
            services.AddSingleton<IProductsRepository, ProductsRepository>();
            services.AddSingleton<IUsersService, UsersService>();
            services.AddSingleton<IUsersRepository, UsersRepository>();
            services.AddSingleton<IAuthenticationService, AuthenticationService>();
            services.AddSingleton<ITokenStore, TokenStore>();
        }

        private void SetupLoggly(LogglySettings logglySettings)
        {
            var config = LogglyConfig.Instance;
            config.CustomerToken = logglySettings.CustomerToken;
            config.ApplicationName = logglySettings.ApplicationName;
            config.Transport = new TransportConfiguration()
            {
                EndpointHostname = logglySettings.EndpointHostname,
                EndpointPort = logglySettings.EndpointPort,
                LogTransport = logglySettings.LogTransport
            };
            config.ThrowExceptions = logglySettings.ThrowExceptions;

            config.TagConfig.Tags.AddRange(new ITag[]{
                new ApplicationNameTag {Formatter = "Application-{0}"},
                new HostnameTag { Formatter = "Host-{0}" }
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseCors(AllowedOrigins);
            app.UseAuthentication();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "NobleCause.SavijSellApi v1"));
            }

            

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
