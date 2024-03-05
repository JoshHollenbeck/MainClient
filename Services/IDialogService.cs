using System.Windows;

namespace MainClient.Services
{
    public interface IDialogService
    {
        void OpenDialog<T>() where T : Window, new();

        void ShowMessage(string message, string title);
    }
}