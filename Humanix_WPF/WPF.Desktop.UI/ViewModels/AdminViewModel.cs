using System.Collections.Generic;
using System.Linq;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;

namespace WPF.Desktop.UI.ViewModels
{
    internal class AdminViewModel : ViewModelBase
    {
        private MainAdminEntity MainAdminEntity { get; set; } = new MainAdminEntity();
        private EMPLOYEES selectedEmployee;

        #region Property

        public EMPLOYEES SelectedEmployee
        {
            get => selectedEmployee;
            set
            {
                selectedEmployee = value;
                ShowEmployeesDetails(value);
                OnPropertyChanged(nameof(SelectedEmployee));
            }
        }

        public ICollection<EMPLOYEES> EMPLOYEES
        {
            get => MainAdminEntity.EMPLOYEES.ToList();
            set
            {
                OnPropertyChanged(nameof(EMPLOYEES));
            }
        }

        public ICollection<VACATIONS> VACATIONS
        {
            get => MainAdminEntity.VACATIONS.ToList();
            set
            {
                OnPropertyChanged(nameof(VACATIONS));
            }
        }

        public ICollection<LOCATIONS> LOCATIONS
        {
            get => MainAdminEntity.LOCATIONS.ToList();
            set
            {
                OnPropertyChanged(nameof(LOCATIONS));
            }
        }

        public ICollection<DEPARTMENTS> DEPARTMENTS
        {
            get => MainAdminEntity.DEPARTMENTS.ToList();
            set
            {
                OnPropertyChanged(nameof(DEPARTMENTS));
            }
        }

        public ICollection<JOBS> JOBS
        {
            get => MainAdminEntity.JOBS.ToList();
            set
            {
                OnPropertyChanged(nameof(JOBS));
            }
        }

        public ICollection<PARTICIPATION> PARTICIPATION
        {
            get => MainAdminEntity.PARTICIPATION.ToList();
            set
            {
                OnPropertyChanged(nameof(PARTICIPATION));
            }
        }

        public ICollection<TASKS> TASKS
        {
            get => MainAdminEntity.TASKS.ToList();
            set
            {
                OnPropertyChanged(nameof(TASKS));
            }
        }

        public ICollection<COUNTRIES> COUNTRIES
        {
            get => MainAdminEntity.COUNTRIES.ToList();
            set
            {
                OnPropertyChanged(nameof(COUNTRIES));
            }
        }

        public ICollection<PROJECTS> PROJECTS
        {
            get => MainAdminEntity.PROJECTS.ToList();
            set
            {
                OnPropertyChanged(nameof(PROJECTS));
            }
        }

        #endregion
    }
}
