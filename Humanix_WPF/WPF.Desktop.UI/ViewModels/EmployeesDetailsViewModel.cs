using Oracle.ManagedDataAccess.Client;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using Wpf.DataValidationLibrary;
using WPF.Desktop.UI.Commands;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;
using WPF.Desktop.UI.Database.Entity_Data_Model.User_User;
using WPF.Desktop.UI.Views.Pages;
using WPF.Desktop.UI.Views.Windows;
using static Wpf.DataValidationLibrary.Validator;

namespace WPF.Desktop.UI.ViewModels
{
    internal class EmployeesDetailsViewModel : ViewModelBase
    {
        #region Constructor

        public EmployeesDetailsViewModel(EMPLOYEES employees, EmployeesDetails view)
        {
            this.View = view;
            selectedEmployees = employees.EMP_ID != 0 ? employees : new EMPLOYEES();
            VisibilityOtherButtons = employees.EMP_ID == 0 ? Visibility.Visible : Visibility.Collapsed;
            VisibilitySaveChangesButton = employees.EMP_ID == 0 ? Visibility.Collapsed : Visibility.Visible;
            admin = new MainAdminEntity();
            validator = new Validator(this);
            using (var context = new UserEntity())
            {
                Jobs = context.Database.SqlQuery<JOBS>("SELECT * FROM ADMIN.JOBS").ToList();
                Departments = context.Database.SqlQuery<DEPARTMENTS>("SELECT * FROM ADMIN.DEPARTMENTS").ToList();
            }
        }

        #endregion

        #region Fields

        private Validator validator;

        private EmployeesDetails View { get; }
        private MainAdminEntity admin;
        private DelegateCommand exitCommand;
        private DelegateCommand saveChangesCommand;
        private DelegateCommand fireEmployeeCommand;
        private DelegateCommand hireEmployeeCommand;

        private EMPLOYEES selectedEmployees = new EMPLOYEES();

        private ICollection<JOBS> _jobs;
        private ICollection<DEPARTMENTS> _departments;

        private Visibility visibilitySaveChangesButton;
        private Visibility visibilityOtherButtons;

        private string errorEmailMessage;
        private string errorFirstNameMessage;
        private string errorLastNameMessage;
        private string errorNumberMessage;
        private string errorCommisionMessage;
        private string errorSalaryMessage;
        private string errorPasswordMessage;
        private string errorJobsMessage;
        private string errorDepartmentsMessage;

        #endregion

        #region Property

        public string Email
        {
            get => selectedEmployees.EMAIL;
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

        public ICollection<JOBS> Jobs
        {
            get => _jobs;
            set
            {
                _jobs = value;
                OnPropertyChanged(nameof(Jobs));
            }
        }

        public ICollection<DEPARTMENTS> Departments
        {
            get => _departments;
            set
            {
                _departments = value;
                OnPropertyChanged(nameof(Departments));
            }
        }

        public Visibility VisibilitySaveChangesButton
        {
            get => visibilitySaveChangesButton;
            set
            {
                visibilitySaveChangesButton = value;
                OnPropertyChanged(nameof(VisibilitySaveChangesButton));
            }
        }

        public Visibility VisibilityOtherButtons
        {
            get => visibilityOtherButtons;
            set
            {
                visibilityOtherButtons = value;
                OnPropertyChanged(nameof(VisibilityOtherButtons));
            }
        }

        #region Errors

        public string ErrorEmailMessage
        {
            get => errorEmailMessage;
            set
            {
                errorEmailMessage = value;
                OnPropertyChanged(nameof(ErrorEmailMessage));
            }
        }

        public string ErrorFirstNameMessage
        {
            get => errorFirstNameMessage;
            set
            {
                errorFirstNameMessage = value;
                OnPropertyChanged(nameof(ErrorFirstNameMessage));
            }
        }

        public string ErrorLastNameMessage
        {
            get => errorLastNameMessage;
            set
            {
                errorLastNameMessage = value;
                OnPropertyChanged(nameof(ErrorLastNameMessage));
            }
        }

        public string ErrorNumberMessage
        {
            get => errorNumberMessage;
            set
            {
                errorNumberMessage = value;
                OnPropertyChanged(nameof(ErrorNumberMessage));
            }
        }

        public string ErrorCommisionMessage
        {
            get => errorCommisionMessage;
            set
            {
                errorCommisionMessage = value;
                OnPropertyChanged(nameof(ErrorCommisionMessage));
            }
        }

        public string ErrorSalaryMessage
        {
            get => errorSalaryMessage;
            set
            {
                errorSalaryMessage = value;
                OnPropertyChanged(nameof(ErrorSalaryMessage));
            }
        }

        public string ErrorPasswordMessage
        {
            get => errorPasswordMessage;
            set
            {
                errorPasswordMessage = value;
                OnPropertyChanged(nameof(ErrorPasswordMessage));
            }
        }

        public string ErrorJobsMessage
        {
            get => errorJobsMessage;
            set
            {
                errorJobsMessage = value;
                OnPropertyChanged(nameof(ErrorJobsMessage));
            }
        }

        public string ErrorDepartmentsMessage
        {
            get => errorDepartmentsMessage;
            set
            {
                errorDepartmentsMessage = value;
                OnPropertyChanged(nameof(ErrorDepartmentsMessage));
            }
        }

        #endregion

        #endregion

        #region Methods


        private bool IsDataCorrect()
        {
            return validator.Verify(ValidationBased.TextTo, FirstName, nameof(ErrorFirstNameMessage)) &
                validator.Verify(ValidationBased.TextTo, LastName, nameof(ErrorLastNameMessage)) &
                validator.Verify(ValidationBased.Email, Email, nameof(ErrorEmailMessage)) &
                validator.Verify(ValidationBased.Numbers, Number, nameof(ErrorNumberMessage)) &
                validator.Verify(ValidationBased.Salary, Salary.ToString(), nameof(ErrorSalaryMessage)) &
                validator.Verify(ValidationBased.Commission, Commission.ToString(), nameof(ErrorCommisionMessage)) &
                Department != null &
                Job != null;
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
                        if (IsDataCorrect())
                        {
                            if (IsDataCorrect())
                            {
                                MessageBox.Show("конградиласьён");

                                var sql = "update_employees(:p_emp_id, :p_first_name, :p_last_name, :p_email, :p_phone_number, :p_job_id, :p_salary, :p_commission_pct, :p_manager_id, :p_department_id)";
                                var result = admin.Database.SqlQuery<int>(sql,
                                    new OracleParameter("p_emp_id", selectedEmployees.EMP_ID),
                                    new OracleParameter("p_first_name", selectedEmployees.FIRST_NAME),
                                    new OracleParameter("p_last_name", selectedEmployees.LAST_NAME),
                                    new OracleParameter("p_email", selectedEmployees.EMAIL),
                                    new OracleParameter("p_phone_number", selectedEmployees.PHONE_NUMBER),
                                    new OracleParameter("p_job_id", selectedEmployees.JOB_ID),
                                    new OracleParameter("p_salary", selectedEmployees.SALARY),
                                    new OracleParameter("p_commission_pct", selectedEmployees.COMMISSION_PCT / 100),
                                    new OracleParameter("p_manager_id", selectedEmployees.MANAGER_ID),
                                    new OracleParameter("p_department_id", selectedEmployees.DEPARTMENT_ID));

                                View.Close();
                                ShowPage(new AdminPage());
                            }
                            else
                            {
                                MessageBox.Show("Ошибка");
                            }
                        }
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
                        ShowPage(new AdminPage());
                        View.Close();
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
                        View.Close();
                        ShowPage(new AdminPage());
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
                        if (IsDataCorrect())
                        {
                            MessageBox.Show("конградиласьён");
                            admin.HIRE_EMPLOYEE(
                                selectedEmployees.FIRST_NAME,
                                selectedEmployees.LAST_NAME,
                                selectedEmployees.EMAIL,
                                selectedEmployees.PHONE_NUMBER,
                                selectedEmployees.JOB_ID,
                                selectedEmployees.SALARY,
                                selectedEmployees.COMMISSION_PCT / 100,
                                selectedEmployees.MANAGER_ID,
                                selectedEmployees.DEPARTMENT_ID,
                                selectedEmployees.PASSWORD_HASH
                            );
                            View.Close();
                            ShowPage(new AdminPage());
                        }
                        else
                        {
                            MessageBox.Show("Ошибка");
                        }
                    });
                }
                return hireEmployeeCommand;
            }
        }

        #endregion

    }
}
