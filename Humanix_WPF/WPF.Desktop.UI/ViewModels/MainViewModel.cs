﻿using System.Windows.Input;
using WPF.Desktop.UI.Commands;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;
using WPF.Desktop.UI.Views;
using WPF.Desktop.UI.Views.Pages;

namespace WPF.Desktop.UI.ViewModels
{
    internal class MainViewModel : ViewModelBase
    {
        #region Fields

        private DelegateCommand openAdminPage;
        private DelegateCommand openProfilePage;
        private DelegateCommand openVacationsPage;
        private DelegateCommand openDepartmentsPage;
        private DelegateCommand openParticipationPage;

        #endregion

        #region Commands

        public ICommand OpenVacationsPage
        {
            get
            {
                if (openVacationsPage == null)
                {
                    openVacationsPage = new DelegateCommand(() =>
                    {
                        ShowPage(new VacationsPage());
                    });
                }
                return openVacationsPage; 
            }
        }

        public ICommand OpenParticipationPage
        {
            get
            {
                if (openParticipationPage == null)
                {
                    openParticipationPage = new DelegateCommand(() =>
                    {
                        ShowPage(new ParticipationPage());
                    });
                }
                return openParticipationPage; 
            }
        }
        
        public ICommand OpenDepartmentsPage
        {
            get
            {
                if (openDepartmentsPage == null)
                {
                    openDepartmentsPage = new DelegateCommand(() =>
                    {
                        ShowPage(new DepartmentPage());
                    });
                }
                return openDepartmentsPage; 
            }
        }

        public ICommand OpenProfilePage
        {
            get
            {
                if (openProfilePage == null)
                {
                    openProfilePage = new DelegateCommand(() =>
                    {
                        ShowPage(new ProfilePage());
                    });
                }
                return openProfilePage;
            }
        } 

        public ICommand OpenAdminPage
        {
            get
            {
                if (openAdminPage == null)
                {
                    openAdminPage = new DelegateCommand(() =>
                    {
                        ShowPage(new AdminPage());
                    });
                }
                return openAdminPage;
            }
        }

        #endregion
    }
}