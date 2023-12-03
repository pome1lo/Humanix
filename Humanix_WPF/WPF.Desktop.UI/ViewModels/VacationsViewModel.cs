using System.Collections.Generic;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;

namespace WPF.Desktop.UI.ViewModels
{
    internal class VacationsViewModel : ViewModelBase
    {
        #region Property

        public ICollection<VACATIONS> Vacations
        {
            get => CurrentUser.VACATIONS;
            set
            {
                CurrentUser.VACATIONS = value;
                OnPropertyChanged(nameof(Vacations));
            }
        }

        #endregion
    }
}
