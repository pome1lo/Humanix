using NodeMailer;
using NodeMailer.Models;
using System.Configuration;
using AuthNumberGenerator;

namespace NUnit.Tests.Tests
{
    public class NodeMailer
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public async Task SendMail()
        {
            SmtpSettings smtp = new SmtpSettings();

            smtp.Server = ConfigurationManager.AppSettings["SmtpServer"];
            smtp.Port = Int32.Parse(ConfigurationManager.AppSettings["SmtpPort"]);
            smtp.User = ConfigurationManager.AppSettings["SmtpUser"];
            smtp.Password = ConfigurationManager.AppSettings["SmtpPassword"];

            var code = RandomNumberGenerator.Generate().ToString();

            MailBuilder builder = new("humanix.wms@mail.ru", code, smtp);
            
            Assert.IsTrue(await builder.SendEmail());
        }
    }
}
