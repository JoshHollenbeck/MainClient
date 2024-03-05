using System.Windows;
using MainClient._ViewModel;
using MainClient.Services;
using MainClient._View;

namespace MainClient
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private void OnStartup(object sender, StartupEventArgs e)
        {
            // Initialize the DialogService
            IDialogService dialogService = new DialogService();

            // Initialize the MainWindow with the DialogService
            LoginWindowVM loginWindowVM = new LoginWindowVM(dialogService);

            // Create MainWindow and set its DataContext
            LoginWindow loginWindow = new LoginWindow
            {
                DataContext = loginWindowVM
            };

            loginWindow.Show();
        }
    }
}