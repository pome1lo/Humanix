using System.Collections.Generic;
using System.Linq;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;

namespace WPF.Desktop.UI.ViewModels
{
    internal class DepartmentsViewModel : ViewModelBase
    {
        #region Property

        public IEnumerable<EMPLOYEES> Departments
        {
            get => CurrentUser.DEPARTMENTS.EMPLOYEES.ToList();
            set
            {
                CurrentUser.DEPARTMENTS.EMPLOYEES = value.ToList();
                OnPropertyChanged(nameof(Departments));
            }
        }

        #endregion
    }
}