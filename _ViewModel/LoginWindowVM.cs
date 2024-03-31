using System;
using System.Security;
using System.Windows;
using System.Windows.Input;
using MainClient._View;
using MainClient._Model;
using MainClient.Services;
using MainClient.Utilities;

namespace MainClient._ViewModel
{
    class LoginWindowVM : ViewModelBase
    {
        private IDialogService _dialogService;
        private string _username;
        private SecureString _password;

        private LoginWindowModel loginWindow;
        
        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                OnPropertyChanged(nameof(Username));
            }
        }

        public SecureString Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }

        public ICommand LoginCommand { get; }

        public ICommand EmployeeCommand { get; }

        public LoginWindowVM(IDialogService dialogService)
        {
            _dialogService = dialogService ?? throw new ArgumentNullException(nameof(dialogService));
            LoginCommand = new RelayCommand(ExecuteLogin);
            EmployeeCommand = new RelayCommand(ExecuteBypass);
        }

        private void ExecuteLogin(object parameter)
        {
            loginWindow = new LoginWindowModel();
            var loginResult = loginWindow.Login(Username, Password);

            if (!loginResult.Result)
            {
                _dialogService.ShowMessage("Username or password is incorrect", "Login Failed");
            }
            else
            {
                // Now that Login returns a tuple, we can directly use the permissions
                RepIdService.Instance.SetPermissions(loginResult.RepId, loginResult.Trading, loginResult.MoveMoney, loginResult.ViewOnly);

                // Initialize the MainWindow with the DialogService
                MainWindowVM mainWindowVM = new MainWindowVM(_dialogService);

                // Create MainWindow and set its DataContext
                MainWindow mainWindow = new MainWindow
                {
                    DataContext = mainWindowVM
                };

                mainWindow.Show();

                // Close the current login window
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.DataContext == this) window.Close();
                }
            }
        }

        /**
            Used to bypass credential checks. Remove before production!!!!!!!!!!!!!!!!!!!!!!!!
            Used to bypass credential checks. Remove before production!!!!!!!!!!!!!!!!!!!!!!!!
            Used to bypass credential checks. Remove before production!!!!!!!!!!!!!!!!!!!!!!!!
            Used to bypass credential checks. Remove before production!!!!!!!!!!!!!!!!!!!!!!!!
            Used to bypass credential checks. Remove before production!!!!!!!!!!!!!!!!!!!!!!!!
            Used to bypass credential checks. Remove before production!!!!!!!!!!!!!!!!!!!!!!!!
            Used to bypass credential checks. Remove before production!!!!!!!!!!!!!!!!!!!!!!!!
            Used to bypass credential checks. Remove before production!!!!!!!!!!!!!!!!!!!!!!!!
            Used to bypass credential checks. Remove before production!!!!!!!!!!!!!!!!!!!!!!!!
        **/
        private void ExecuteBypass(object parameter)
        {
            loginWindow = new LoginWindowModel();
            var loginResult = loginWindow.LoginBypass();

            if (!loginResult.Result)
            {
                _dialogService.ShowMessage("Username or password is incorrect", "Login Failed");
            }
            else
            {
                // Now that Login returns a tuple, we can directly use the permissions
                RepIdService.Instance.SetPermissions(loginResult.RepId, loginResult.Trading, loginResult.MoveMoney, loginResult.ViewOnly);

                // Initialize the MainWindow with the DialogService
                MainWindowVM mainWindowVM = new MainWindowVM(_dialogService);

                // Create MainWindow and set its DataContext
                MainWindow mainWindow = new MainWindow
                {
                    DataContext = mainWindowVM
                };

                mainWindow.Show();

                // Close the current login window
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.DataContext == this) window.Close();
                }
            }
        }

        public LoginWindowVM()
        {

        }

        
    }
}

