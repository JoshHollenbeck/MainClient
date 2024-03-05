using System.Windows;
using MainClient._ViewModel;

namespace MainClient._View
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            DataContext = new MainWindowVM();
        }

        private void Exit(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void SwitchClient_Click(object sender, RoutedEventArgs e) { }

        private void ClearSession_Click(object sender, RoutedEventArgs e) { }

        // TODO Add no client selected functionality for Client Account Navigation
    }
}
