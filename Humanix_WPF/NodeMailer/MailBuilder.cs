using System;
using System.Configuration;
using AuthNumberGenerator;
using MailKit.Net.Smtp;
using MimeKit;
using NodeMailer.Models;

namespace NodeMailer
{
    public class MailBuilder
    {
        private string _email;
        private string _body = "Your authentication code: ";
        private SmtpSettings _smtpSettings;

        public MailBuilder(string email)
        {
            _email = email;
            _smtpSettings = new SmtpSettings();
            _body += RandomNumberGenerator.Generate().ToString();
        }

        public bool SendEmail(string body = null, string subject = "Authentication")
        {
            try
            {
                _body = body ?? _body;

                var message = new MimeMessage();
                message.From.Add(new MailboxAddress("Your Name", _smtpSettings.User));
                message.To.Add(new MailboxAddress("", _email));
                message.Subject = subject;

                message.Body = new TextPart("plain")
                {
                    Text = _body
                };

                using (var client = new SmtpClient())
                {
                    client.Connect(_smtpSettings.Server, _smtpSettings.Port, false);
                    client.Authenticate(_smtpSettings.User, _smtpSettings.Password);
                    client.Send(message);
                    client.Disconnect(true);
                }
                return true;
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }
    }
}
