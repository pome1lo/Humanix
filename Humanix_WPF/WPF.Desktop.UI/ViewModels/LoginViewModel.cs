using Oracle.ManagedDataAccess.Client;
using System;
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
                        base.Db = new MainAdminEntity();

                        var sql = "SELECT login_employee(:p_email, :p_password) FROM dual";
                        var result = Db.Database.SqlQuery<int>(sql,
                            new OracleParameter("p_email", Email),
                            new OracleParameter("p_password", Password))
                        .SingleOrDefault();



                        SetCurrentUser(((MainAdminEntity)Db).EMPLOYEES.FirstOrDefault(x => x.EMP_ID == 5));
                        //SetCurrentUser(new EMPLOYEES() { 
                        //    FIRST_NAME= "Alexey",
                        //    LAST_NAME="Puzikov",
                        //    HIRE_DATE=DateTime.Now,
                        //    SALARY=3000,
                        //    PHONE_NUMBER="3758963582459",
                            
                        //});
                        
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
