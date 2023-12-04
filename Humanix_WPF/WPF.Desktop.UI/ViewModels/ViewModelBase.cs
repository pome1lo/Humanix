using System.ComponentModel;
using System.Data.Entity;
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
        protected DbContext Db { get; set; }

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
            MainWindow view = new MainWindow();
            MainFrame = view.MainFrame;
            ShowPage(new ProfilePage());
            view.Show();
        }
        protected void SetCurrentUser(EMPLOYEES empl) => CurrentUser = empl;
        protected static void ShowPage(Page page) => MainFrame.Content = page;
    }
}