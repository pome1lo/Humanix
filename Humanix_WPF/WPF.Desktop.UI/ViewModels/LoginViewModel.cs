using AuthNumberGenerator;
using NodeMailer;
using NodeMailer.Models;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using WPF.Desktop.UI.Commands;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;
using WPF.Desktop.UI.Views;

namespace WPF.Desktop.UI.ViewModels
{
    internal class LoginViewModel : ViewModelBase
    {
        #region Fields

        private DelegateCommand<LoginWindow> loginCommand;
        private DelegateCommand<LoginWindow> authCommand;
        private DelegateCommand exitCommand;
        private DelegateCommand sendAgainCommand;

        private string errorPasswordMessage = string.Empty;
        private string errorEmailMessage = string.Empty;
        private string errorAuthCode = string.Empty;
        private string authCode;
        private string inputAuthCode;

        private LoginWindow view;
        private EMPLOYEES InputEmployee { get; set; } = new EMPLOYEES();

        private Visibility visibilityAuthStackPanel = Visibility.Collapsed;
        private Visibility visibilityLoginStackPanel= Visibility.Visible;

        #endregion

        #region Property

        public Visibility VisibilityAuthStackPanel
        {
            get => visibilityAuthStackPanel;
            set
            {
                visibilityAuthStackPanel = value;
                OnPropertyChanged(nameof(VisibilityAuthStackPanel));
            }
        }

        public Visibility VisibilityLoginStackPanel
        {
            get => visibilityLoginStackPanel;
            set
            {
                visibilityLoginStackPanel = value;
                OnPropertyChanged(nameof(VisibilityLoginStackPanel));
            }
        }
        
        public string InputAuthCode
        {
            get => inputAuthCode;
            set
            {
                inputAuthCode = value;
                OnPropertyChanged(nameof(InputAuthCode));
            }
        }

        public string Email
        {
            get => InputEmployee.EMAIL;
            set
            {
                InputEmployee.EMAIL = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        public string Password
        {
            get => InputEmployee.PASSWORD_HASH;
            set
            {
                InputEmployee.PASSWORD_HASH = value;
                OnPropertyChanged(nameof(Password));
            }
        }

        #region Errors

        public string ErrorEmailMessage
        {
            get => errorEmailMessage;
            set
            {
                errorEmailMessage = value;
                OnPropertyChanged(nameof(ErrorEmailMessage));
            }
        }

        public string ErrorPasswordMessage
        {
            get => errorPasswordMessage;
            set
            {
                errorPasswordMessage = value;
                OnPropertyChanged(nameof(ErrorPasswordMessage));
            }
        }
        
        public string ErrorAuthCode
        {
            get => errorAuthCode;
            set
            {
                errorAuthCode = value;
                OnPropertyChanged(nameof(ErrorAuthCode));
            }
        }

        #endregion

        #endregion

        #region Methods


        private void SuccessfulLogin()
        {
            SetCurrentUser(InputEmployee);
            ShowMainWindow();
            view.Close();
        }


        private async void SendAuthCode()
        {
            this.authCode = RandomNumberGenerator.Generate().ToString();
            SmtpSettings smtp = new SmtpSettings()
            {
                Server = System.Configuration.ConfigurationManager.AppSettings["SmtpServer"],
                Port = Int32.Parse(System.Configuration.ConfigurationManager.AppSettings["SmtpPort"]),
                User = System.Configuration.ConfigurationManager.AppSettings["SmtpUser"],
                Password = System.Configuration.ConfigurationManager.AppSettings["SmtpPassword"]
            };
            await new MailBuilder(InputEmployee.EMAIL, authCode.ToString(), smtp).SendEmail();
        }
         
        private void SetIsAuthentic()
        {
            InputEmployee.ISAUTHENTIC = true;

            using (var context = new MainAdminEntity())
            {
                var emailParam = new OracleParameter("p_email", InputEmployee.EMAIL);
                context.Database.ExecuteSqlCommand("BEGIN SetIsAuthentic(:p_email); END;", emailParam);
            }
        }

        #endregion

        #region Commands

        public ICommand LoginCommand
        {
            get
            {
                if (loginCommand == null)
                {
                    loginCommand = new DelegateCommand<LoginWindow>((LoginWindow view) =>
                    {
                        this.view = view;
                        var entity = new MainAdminEntity();
                        {
                            var sql = "SELECT login_employee(:p_email, :p_password) FROM dual";
                            var result = entity.Database.SqlQuery<int>(sql,
                                new OracleParameter("p_email", Email),
                                new OracleParameter("p_password", Password))
                            .SingleOrDefault();

                            if (result != 0)
                            {
                                InputEmployee = entity.EMPLOYEES.FirstOrDefault(x => x.EMP_ID == result);
                                if (InputEmployee.ISAUTHENTIC)
                                {
                                    SuccessfulLogin();
                                }
                                else
                                {
                                    VisibilityAuthStackPanel = Visibility.Visible;
                                    VisibilityLoginStackPanel = Visibility.Collapsed;

                                    SendAuthCode();
                                }
                            }
                            else
                            {
                                ErrorEmailMessage = "Invalid email";
                                ErrorPasswordMessage = "Invalid password";
                            }
                            
                        }
                    });
                }
                return loginCommand;
            }
        }

        public ICommand ExitCommand
        {
            get
            {
                if (exitCommand == null)
                {
                    exitCommand = new DelegateCommand(
                        System.Windows.Application.Current.Shutdown
                    );
                }
                return exitCommand;
            }
        }
        
        public ICommand AuthCommand
        {
            get
            {
                if (authCommand == null)
                {
                    authCommand = new DelegateCommand<LoginWindow>((LoginWindow view) =>
                    {
                        this.view = view;
                        if (authCode == InputAuthCode)
                        {
                            SetIsAuthentic();
                            SuccessfulLogin();
                        }
                        else
                        {
                            ErrorAuthCode = "Auth code is not valid";
                        }
                    });
                }
                return authCommand;
            }
        }

        public ICommand SendAgainCommand
        {
            get
            {
                if (sendAgainCommand == null)
                {
                    sendAgainCommand = new DelegateCommand(() =>
                    {
                        SendAuthCode();
                    });
                }
                return sendAgainCommand;
            }
        }

        #endregion
    }
}