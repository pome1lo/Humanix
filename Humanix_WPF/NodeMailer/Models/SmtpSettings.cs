using System;
using System.Configuration;

namespace NodeMailer.Models
{
    public class SmtpSettings
    {
        public int Port { get; set; }
        public string User { get; set; }
        public string Server { get; set; }
        public string Password { get; set; }

        public SmtpSettings()
        {
            Server = ConfigurationManager.AppSettings["SmtpServer"];
            Port = Int32.Parse(ConfigurationManager.AppSettings["SmtpPort"]);
            User = ConfigurationManager.AppSettings["SmtpUser"];
            Password = ConfigurationManager.AppSettings["SmtpPassword"];
        }

        public SmtpSettings(int port, string user, string server, string password)
        {
            this.Port = port;
            this.User = user;
            this.Server = server;
            this.Password = password;
        }
    }
}