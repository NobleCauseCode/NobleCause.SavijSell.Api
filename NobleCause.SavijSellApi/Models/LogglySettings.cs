using Loggly.Config;

namespace NobleCause.SavijSellApi.Models
{
    public class LogglySettings
    {
        public string ApplicationName { get; set; }
        public string Account { get; set; }
        public int EndpointPort { get; set; }
        public bool IsEnabled { get; set; }
        public bool ThrowExceptions { get; set; }
        public LogTransport LogTransport { get; set; }
        public string EndpointHostname { get; set; }
        public string CustomerToken { get; set; }
    }
}
