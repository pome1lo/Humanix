using System.Collections.Generic;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;

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

        public string Phone
        {
            get => CurrentUser.PHONE_NUMBER;
            set
            {
                CurrentUser.PHONE_NUMBER = value;
                OnPropertyChanged(nameof(Phone));
            }
        }

        public string Email
        {
            get => CurrentUser.EMAIL;
            set
            {
                CurrentUser.EMAIL = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        

        #endregion
    }
}
