using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows;

namespace MainClient.Utilities
{
    class ViewModelBase : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        private object _currentView;

        public object CurrentView
        {
            get { return _currentView; }
            set
            {
                _currentView = value;
                OnPropertyChanged();
            }
        }

        public void OnPropertyChanged([CallerMemberName] string propName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propName));
        }

        protected void LoadViewModel<T>(string accountNumber, Func<string, T> viewModelFactory) where T : class
        {
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                CurrentView = viewModelFactory(accountNumber);
            }
        }
    }
}
