using System.Windows;
using System.Windows.Controls;
using MainClient._Model;
using MainClient._ViewModel;

namespace MainClient._View
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void ClientAcctsResults_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (e.AddedItems.Count > 0)
            {
                var selectedAccount = e.AddedItems[0] as MainWindowModel;
                if (selectedAccount != null)
                {
                    var mainWindowVM = DataContext as MainWindowVM;
                    if (mainWindowVM != null)
                    {
                        // Assuming you have a method or way to handle the change in ViewModel
                        mainWindowVM.HandleSelectionChange(selectedAccount);
                    }
                }
            }
        }

        private void Exit(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void SwitchClient_Click(object sender, RoutedEventArgs e) { }

        private void ClearSession_Click(object sender, RoutedEventArgs e) { }
    }
}
