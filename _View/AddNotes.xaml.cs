using System.Windows;
using MainClient._ViewModel;
using MainClient.Services;

namespace MainClient._View
{
    public partial class AddNotes : Window
    {
        public AddNotes()
        {
            InitializeComponent();
            
            this.Loaded += AddNotes_Loaded;         
        }

        private void AddNotes_Loaded(object sender, RoutedEventArgs e)
        {
            if (DataContext is AddNotesVM viewModel)
            {
                viewModel.CloseNote = CloseWindow;
            }
        }

        private void CloseWindow()
        {
            this.Close(); // Closes the window
        }
    }
}
