using Oracle.ManagedDataAccess.Client;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using WPF.Desktop.UI.Commands;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_User;
using WPF.Desktop.UI.Views;

namespace WPF.Desktop.UI.ViewModels
{
    internal class LoginViewModel : ViewModelBase
    {
        #region Fields

        private DelegateCommand<LoginWindow> loginCommand;
        private DelegateCommand exitCommand;

        private string errorPasswordMessage = string.Empty;
        private string errorEmailMessage = string.Empty;
        private EMPLOYEES InputEmployee { get; set; } = new EMPLOYEES();

        #endregion

        #region Property

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

        #endregion

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
                        var entity = new MainAdminEntity();
                        {
                            //var sql = "SELECT login_employee(:p_email, :p_password) FROM dual";
                            //var result = Db.Database.SqlQuery<int>(sql,
                            //    new OracleParameter("p_email", Email),
                            //    new OracleParameter("p_password", Password))
                            //.SingleOrDefault();

                            int result = 3;

                            if (result != 0)
                            {
                                SetCurrentUser(entity.EMPLOYEES.FirstOrDefault(x => x.EMP_ID == result));
                                ShowMainWindow();
                                view.Close();
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

        #endregion
    }
}
