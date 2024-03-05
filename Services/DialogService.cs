using System.Windows;

namespace MainClient.Services
{
    public class DialogService : IDialogService
    {
        public void OpenDialog<T>() where T : Window, new()
        {
            T view = new T();
            view.ShowDialog();
        }

        public void ShowMessage(string message, string title)
        {
            MessageBox.Show(message, title);
        }
    }
}