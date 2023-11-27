using Oracle.ManagedDataAccess.Client;
using System.Linq;
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

        private EMPLOYEES inputEmployee = new EMPLOYEES();

        #endregion

        #region Property

        public string Email
        {
            get => inputEmployee.EMAIL;
            set
            {
                inputEmployee.EMAIL = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        public string Password
        {
            get => inputEmployee.PASSWORD_HASH;
            set
            {
                inputEmployee.PASSWORD_HASH = value;
                OnPropertyChanged(nameof(Password));
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
                        base.db = new MainAdminEntity();

                        var sql = "SELECT login_employee(:p_email, :p_password) FROM dual";
                        var result = db.Database.SqlQuery<int>(sql,
                            new OracleParameter("p_email", Email),
                            new OracleParameter("p_password", Password))
                        .SingleOrDefault();



                        SetCurrentUser(((MainAdminEntity)db).EMPLOYEES.FirstOrDefault(x => x.EMP_ID == 5));
                        ShowMainWindow();
                        view.Close();
                    });
                }
                return loginCommand;
            }
        }

        #endregion
    }
}
