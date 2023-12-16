using NodeMailer;

namespace NUnit.Tests.Tests
{
    public class NodeMailer
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void SendMail()
        {
            MailBuilder builder = new("humanix.wms@mail.ru");
            Assert.IsTrue(builder.SendEmail());
        }
    }
}
