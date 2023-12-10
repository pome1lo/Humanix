using System.Linq;
using System.Windows;
using System.Windows.Input;
using Wpf.DataValidationLibrary;
using WPF.Desktop.UI.Commands;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;
using WPF.Desktop.UI.Database.Entity_Data_Model.User_User;
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

        private string errorEmailMessage;
        private string errorLastNameMessage;
        private string errorFirstNameMessage;

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

        public string Email
        {
            get => CurrentUser.EMAIL;
            set
            {
                CurrentUser.EMAIL = value;
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
                            using (var context = new UserEntity())
                            {
                                var list = context.Database.SqlQuery<EMPLOYEES>("SELECT * FROM ADMIN.EMPLOYEES");

                                if (list.Any(x => x.EMAIL == Email))
                                {
                                    //SendToModalWindow("Incorrect data.");
                                }
                                else
                                {
                                    //CurrentUser.Email = Email;
                                    //CurrentUser.UserName = UserName;
                                    //CurrentUser.SocialNetworks.Telegram = Telegram;
                                    //CurrentUser.SocialNetworks.Instagram = Instagram;
                                    //CurrentUser.SocialNetworks.Vkontakte = Vkontakte;

                                    //Db.Save();
                                    MessageBox.Show("Your data has been successfully changed");
                                }
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
