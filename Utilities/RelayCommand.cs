using System;
using System.Windows.Input;

namespace MainClient.Utilities
{
    class RelayCommand : ICommand
    {
        private readonly Action<object> _execute;
        private readonly Func<object, bool> _canExecute;

        public event EventHandler CanExecuteChanged
        {
            add { CommandManager.RequerySuggested += value; }
            remove { CommandManager.RequerySuggested -= value; }
        }
        public RelayCommand(Action<object> execute, Func<object, bool> canExecute = null)
        {
            _execute = execute ?? throw new ArgumentNullException(nameof(execute));
            _canExecute = canExecute;
        }

        public RelayCommand(Action<object> executeSingleClick, Action<object> executeDoubleClick, Func<object, bool> canExecute = null)
        {
            _execute = parameter =>
            {
                var mouseEventArgs = parameter as MouseButtonEventArgs;
                if (mouseEventArgs != null && mouseEventArgs.ClickCount == 2)
                {
                    executeDoubleClick?.Invoke(parameter);
                }
                else
                {
                    executeSingleClick?.Invoke(parameter);
                }
            };
            _canExecute = canExecute;
        }
        
        public bool CanExecute(object parameter) => _canExecute == null || _canExecute(parameter);
        public void Execute(object parameter) => _execute(parameter);
    }
}
