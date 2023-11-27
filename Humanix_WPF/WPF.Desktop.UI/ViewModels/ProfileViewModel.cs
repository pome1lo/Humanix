using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin;

namespace WPF.Desktop.UI.ViewModels
{
    internal class ProfileViewModel : ViewModelBase
    {

        #region Fields

        
        
        #endregion

        #region Property

        public string FirstName
        {
            get => CurrentUser.FIRST_NAME;
            set
            {
                CurrentUser.FIRST_NAME = value;
                OnPropertyChanged(nameof(FirstName));
            }
        }

        public string LastName
        {
            get => CurrentUser.LAST_NAME;
            set
            {
                CurrentUser.LAST_NAME = value;
                OnPropertyChanged(nameof(LastName));
            }
        }

        #endregion
    }
}
