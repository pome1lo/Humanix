using System.Collections.Generic;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;

namespace WPF.Desktop.UI.ViewModels
{
    internal class DepartmentsViewModel : ViewModelBase
    {
        #region Property

        public ICollection<EMPLOYEES> Departments
        {
            get => CurrentUser.DEPARTMENTS.EMPLOYEES;
            set
            {
                CurrentUser.DEPARTMENTS.EMPLOYEES = value;
                OnPropertyChanged(nameof(Departments));
            }
        }

        #endregion
    }
}