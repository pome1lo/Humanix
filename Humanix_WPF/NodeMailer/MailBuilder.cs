using MailKit.Net.Smtp;
using MimeKit;
using NodeMailer.Models;
using System;

namespace NodeMailer
{
    public class MailBuilder
    {
        private string _email;
        private string _body;
        private SmtpSettings _smtpSettings;

        public MailBuilder(string email, string code, SmtpSettings smtp)
        {
            _body = $"<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <style>\r\n        body {{\r\n            font-family: Arial, sans-serif;\r\n            margin: 0;\r\n            padding: 0;\r\n            background-color: #f0f0f0;\r\n        }}\r\n        .email-container {{\r\n            width: 100%;\r\n            max-width: 600px;\r\n            margin: 0 auto;\r\n            padding: 20px;\r\n            background-color: #ffffff;\r\n            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);\r\n        }}\r\n        .header {{\r\n            text-align: center;\r\n            padding: 20px 0;\r\n            border-bottom: 1px solid #ddd;\r\n            background: linear-gradient(to right, #800080, #9932CC);\r\n            color: white;\r\n            box-shadow: 0 4px 2px -2px rgba(0,0,0,0.1);\r\n        }}\r\n        .content {{\r\n            padding: 20px;\r\n        }}\r\n        .footer {{\r\n            text-align: center;\r\n            padding: 20px 0;\r\n            border-top: 1px solid #ddd;\r\n            color: #888;\r\n            font-size: 14px;\r\n        }}\r\n        h1 {{\r\n            color: #800080;\r\n            text-shadow: 2px 2px 4px #999;\r\n        }}\r\n    </style>\r\n</head>\r\n<body>\r\n    <div class=\"email-container\">\r\n        <div class=\"header\"> \r\n        </div>\r\n        <div class=\"content\">\r\n            <h2>Hello,</h2>\r\n            <p>Your authorization code:</p>\r\n            <h1>{code}</h1>\r\n            <p>Please enter this code to continue the authorization process..</p>\r\n        </div>\r\n        <div class=\"footer\">\r\n            © 2023 Humanix. All rights reserved.\r\n        </div>\r\n    </div>\r\n</body>\r\n</html>\r\n";
            _email = email;
            _smtpSettings = smtp;
        }

        public async System.Threading.Tasks.Task<bool> SendEmail(string subject = "Authentication")
        {
            try
            {
                var message = new MimeMessage();
                message.From.Add(new MailboxAddress("Humanix", _smtpSettings.User));
                message.To.Add(new MailboxAddress("", _email));
                message.Subject = subject;

                message.Body = new TextPart(MimeKit.Text.TextFormat.Html)
                {
                    Text = _body
                };

                using (var client = new SmtpClient())
                {
                    await client.ConnectAsync(_smtpSettings.Server, _smtpSettings.Port, true);
                    await client.AuthenticateAsync(_smtpSettings.User, _smtpSettings.Password);
                    await client.SendAsync(message);
                    await client.DisconnectAsync(true);
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }
    }
}
