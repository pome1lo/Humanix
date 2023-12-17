namespace NodeMailer.Models
{
    public class SmtpSettings
    {
        public int Port { get; set; } = 0;
        public string User { get; set; } = string.Empty;
        public string Server { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }
}