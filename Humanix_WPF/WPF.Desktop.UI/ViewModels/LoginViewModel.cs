using System.Linq;
using System.Windows.Input;
using WPF.Desktop.UI.Commands;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin;
using WPF.Desktop.UI.Database.Entity_Data_Model.User_User;
using WPF.Desktop.UI.Views;

namespace WPF.Desktop.UI.ViewModels
{
    internal class LoginViewModel : ViewModelBase
    {
        #region Fields

        private DelegateCommand<LoginWindow> loginCommand;

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
                        SetCurrentUser(((MainAdminEntity)db).EMPLOYEES.Find(22));
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
