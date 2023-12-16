using AuthNumberGenerator;

namespace NUnit.Tests.Tests
{
    public class AuthNumberGenerator
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void CheckingForSixDigitValue()
        {
            var expectedResult = 6;
            var result = RandomNumberGenerator.Generate().ToString().Length;
            Assert.AreEqual(expectedResult, result);
        }
    }
}