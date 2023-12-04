using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using WPF.Desktop.UI.Commands;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;
using WPF.Desktop.UI.Views.Pages;
using WPF.Desktop.UI.Views.Windows;

namespace WPF.Desktop.UI.ViewModels
{
    internal class EmployeesDetailsViewModel : ViewModelBase
    {
        #region Constructor

        public EmployeesDetailsViewModel(EMPLOYEES employees, EmployeesDetails view)
        {
            this.view = view;
            this.admin = new MainAdminEntity();
            this.selectedEmployees = employees;
        }

        #endregion

        #region Fields
        private EmployeesDetails view;
        private MainAdminEntity admin; 
        private DelegateCommand exitCommand;
        private DelegateCommand saveChangesCommand;
        private DelegateCommand fireEmployeeCommand;
        private DelegateCommand hireEmployeeCommand;
        private EMPLOYEES selectedEmployees = new EMPLOYEES();

        #endregion

        #region Property

        public string Email
        {
            get
            {
                if (selectedEmployees == null)
                {
                    selectedEmployees = new EMPLOYEES();
                }
                return selectedEmployees.EMAIL;
            }
            set
            {
                selectedEmployees.EMAIL = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        public string FirstName
        {
            get => selectedEmployees.FIRST_NAME;
            set
            {
                selectedEmployees.FIRST_NAME = value;
                OnPropertyChanged(nameof(FirstName));
            }
        }

        public string LastName
        {
            get => selectedEmployees.LAST_NAME;
            set
            {
                selectedEmployees.LAST_NAME = value;
                OnPropertyChanged(nameof(LastName));
            }
        }

        public string Number
        {
            get => selectedEmployees.PHONE_NUMBER;
            set
            {
                selectedEmployees.PHONE_NUMBER = value;
                OnPropertyChanged(nameof(Number));
            }
        }

        public decimal? Commission
        {
            get => selectedEmployees.COMMISSION_PCT;
            set
            {
                selectedEmployees.COMMISSION_PCT = value;
                OnPropertyChanged(nameof(Commission));
            }
        }

        public DateTime HireDate
        {
            get => selectedEmployees.HIRE_DATE;
            set
            {
                selectedEmployees.HIRE_DATE = value;
                OnPropertyChanged(nameof(HireDate));
            }
        }

        public decimal? Salary
        {
            get => selectedEmployees.SALARY;
            set
            {
                selectedEmployees.SALARY = value;
                OnPropertyChanged(nameof(Salary));
            }
        }

        public string Password
        {
            get => selectedEmployees.PASSWORD_HASH;
            set
            {
                selectedEmployees.PASSWORD_HASH = value;
                OnPropertyChanged(nameof(Password));
            }
        }

        public JOBS Job
        {
            get => selectedEmployees.JOBS;
            set
            {
                selectedEmployees.JOBS = value;
                selectedEmployees.JOB_ID = value.JOB_ID;
                OnPropertyChanged(nameof(Job));
            }
        }

        public DEPARTMENTS Department
        {
            get => selectedEmployees.DEPARTMENTS;
            set
            {
                selectedEmployees.DEPARTMENTS = value;
                selectedEmployees.DEPARTMENT_ID = value.DEPARTMENT_ID;
                OnPropertyChanged(nameof(Department));
            }
        }

        public List<JOBS> Jobs
        {
            get => admin.JOBS.ToList();
            set
            {
                OnPropertyChanged(nameof(Jobs));
            }
        }
        
        public List<DEPARTMENTS> Departments
        {
            get => admin.DEPARTMENTS.ToList();
            set
            {
                OnPropertyChanged(nameof(Departments));
            }
        }

        #endregion

        #region Command

        public ICommand SaveChangesCommand
        {
            get
            {
                if (saveChangesCommand == null)
                {
                    saveChangesCommand = new DelegateCommand(() =>
                    {
                        MessageBox.Show("конградиласьён");

                        admin.UPDATE_EMPLOYEES(
                            selectedEmployees.EMP_ID,
                            selectedEmployees.FIRST_NAME,
                            selectedEmployees.LAST_NAME,
                            selectedEmployees.EMAIL,
                            selectedEmployees.PHONE_NUMBER,
                            selectedEmployees.HIRE_DATE,
                            selectedEmployees.JOB_ID,
                            selectedEmployees.SALARY,
                            selectedEmployees.COMMISSION_PCT,
                            selectedEmployees.MANAGER_ID,
                            selectedEmployees.DEPARTMENT_ID
                        );

                        view.Close();
                        ShowPage(new AdminPage());
                    });
                }
                return saveChangesCommand;
            }
        }

        public ICommand ExitCommand
        {
            get
            {
                if (exitCommand == null)
                {
                    exitCommand = new DelegateCommand(() =>
                    {
                        view.Close();
                    });
                }
                return exitCommand;
            }
        }
        
        public ICommand FireEmployeeCommand
        {
            get
            {
                if (fireEmployeeCommand == null)
                {
                    fireEmployeeCommand = new DelegateCommand(() =>
                    {
                        admin.FIRE_EMPLOYEE(selectedEmployees.EMP_ID);
                    });
                }
                return fireEmployeeCommand;
            }
        }
        
        public ICommand HireEmployeeCommand
        {
            get
            {
                if (hireEmployeeCommand == null)
                {
                    hireEmployeeCommand = new DelegateCommand(() =>
                    {
                        MessageBox.Show(selectedEmployees.EMAIL);
                        admin.HIRE_EMPLOYEE(
                            selectedEmployees.FIRST_NAME,
                            selectedEmployees.LAST_NAME,
                            selectedEmployees.EMAIL,
                            selectedEmployees.PHONE_NUMBER,
                            selectedEmployees.HIRE_DATE,
                            selectedEmployees.JOB_ID,
                            selectedEmployees.SALARY,
                            selectedEmployees.COMMISSION_PCT,
                            selectedEmployees.MANAGER_ID,
                            selectedEmployees.DEPARTMENT_ID,
                            selectedEmployees.PASSWORD_HASH
                        );
                    });
                }
                return hireEmployeeCommand;
            }
        }

        #endregion

    }
}
