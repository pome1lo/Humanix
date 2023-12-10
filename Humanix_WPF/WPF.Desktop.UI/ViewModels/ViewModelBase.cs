using System.ComponentModel;
using System.Windows.Controls;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;
using WPF.Desktop.UI.Views;
using WPF.Desktop.UI.Views.Pages;
using WPF.Desktop.UI.Views.Windows;

namespace WPF.Desktop.UI.ViewModels
{
    internal class ViewModelBase : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        protected static EMPLOYEES CurrentUser { get; private set; }

        private static Frame MainFrame = new Frame();





        protected static void ShowEmployeesDetails(EMPLOYEES emp)
        {
            var view = new EmployeesDetails();
            var viewModel = new EmployeesDetailsViewModel(emp, view);
            view.DataContext = viewModel;
            view.ShowDialog();
        }

        protected static void ShowMainWindow()
        {
            var view = new MainWindow();
            var viewModel = new MainViewModel(IsCurrentUserAdmin());
            view.DataContext = viewModel;
            MainFrame = view.MainFrame;
            ShowPage(new ProfilePage());
            view.Show();
        }

        private static bool IsCurrentUserAdmin()
        {
            return CurrentUser.DEPARTMENTS.DEPARTMENT_NAME == "Human Resources";
        }

        protected void SetCurrentUser(EMPLOYEES empl) => ViewModelBase.CurrentUser = empl;

        protected static void ShowPage(Page page) => MainFrame.Content = page;
    }
}