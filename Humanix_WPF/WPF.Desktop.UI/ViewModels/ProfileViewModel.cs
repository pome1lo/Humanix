using Oracle.ManagedDataAccess.Client;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using Wpf.DataValidationLibrary;
using WPF.Desktop.UI.Commands;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_User;
using WPF.Desktop.UI.Database.Entity_Data_Model.User_User;
using WPF.Desktop.UI.Views.Pages;
using static Wpf.DataValidationLibrary.Validator;

namespace WPF.Desktop.UI.ViewModels
{
    internal class ProfileViewModel : ViewModelBase
    {
        #region Contstructor

        public ProfileViewModel()
        {
            this.validator = new Validator(this);
        }

        #endregion

        #region Fields

        private DelegateCommand saveChangesCommand;
        private Validator validator;

        private string _FirstName = CurrentUser.FIRST_NAME;
        private string _LastName = CurrentUser.LAST_NAME;
        private string _Email = CurrentUser.EMAIL;

        private string errorEmailMessage;
        private string errorLastNameMessage;
        private string errorFirstNameMessage;
        private MainAdminEntity admin = new MainAdminEntity();

        #endregion

        #region Property 

        public string FirstName
        {
            get => _FirstName;
            set
            {
                _FirstName = value;
                OnPropertyChanged(nameof(FirstName));
            }
        }

        public string LastName
        {
            get => _LastName;
            set
            {
                _LastName = value;
                OnPropertyChanged(nameof(LastName));
            }
        }

        public string Email
        {
            get => _Email;
            set
            {
                _Email = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        #region Errors

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

        public string ErrorEmailMessage
        {
            get => errorEmailMessage;
            set
            {
                errorEmailMessage = value;
                OnPropertyChanged(nameof(ErrorEmailMessage));
            }
        }

        #endregion

        #endregion

        #region Methods

        private bool IsTheProfileCorrect()
        {
            return validator.Verify(ValidationBased.TextTo, FirstName, nameof(ErrorFirstNameMessage)) &
                    validator.Verify(ValidationBased.Email, Email, nameof(ErrorEmailMessage)) &
                    validator.Verify(ValidationBased.TextTo, LastName, nameof(ErrorLastNameMessage));
        }

        #endregion

        #region Commands

        public ICommand SaveChangesCommand
        {
            get
            {
                if (saveChangesCommand == null)
                {
                    saveChangesCommand = new DelegateCommand(() =>
                    {
                        if (IsTheProfileCorrect())
                        {
                            if (admin.EMPLOYEES.Any(x => x.EMAIL == this._Email) && this._Email != CurrentUser.EMAIL)
                            {
                                ErrorEmailMessage = "A user with this email already exists";
                            }
                            else
                            {
                                CurrentUser.LAST_NAME = _LastName;
                                CurrentUser.FIRST_NAME = _FirstName;
                                CurrentUser.EMAIL = _Email;
                                admin.Database.ExecuteSqlCommand("BEGIN update_employees(:p_emp_id, :p_first_name, :p_last_name, :p_email, :p_phone_number, :p_job_id, :p_salary, :p_commission_pct, :p_manager_id, :p_department_id); END;",
                                    new OracleParameter("p_emp_id", CurrentUser.EMP_ID),
                                    new OracleParameter("p_first_name", this._FirstName),
                                    new OracleParameter("p_last_name", this._LastName),
                                    new OracleParameter("p_email", this._Email),
                                    new OracleParameter("p_phone_number", CurrentUser.PHONE_NUMBER),
                                    new OracleParameter("p_job_id", CurrentUser.JOB_ID),
                                    new OracleParameter("p_salary", CurrentUser.SALARY),
                                    new OracleParameter("p_commission_pct", CurrentUser.COMMISSION_PCT),
                                    new OracleParameter("p_manager_id", CurrentUser.MANAGER_ID),
                                    new OracleParameter("p_department_id", CurrentUser.DEPARTMENT_ID)
                                );

                                ShowPage(new ProfilePage()); 
                                MessageBox.Show("Your data has been successfully changed");
                            }
                        }
                    });
                }
                return saveChangesCommand;
            }
        }

        #endregion
    }
}
