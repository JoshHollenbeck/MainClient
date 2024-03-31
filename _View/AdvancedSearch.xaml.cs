using System.Windows;
using MainClient._ViewModel;
using System.Windows.Controls;

namespace MainClient._View
{
    /// <summary>
    /// Interaction logic for AdvancedSearch.xaml
    /// </summary>
    public partial class AdvancedSearch : Window
    {
        public AdvancedSearch()
        {
            InitializeComponent();
            
            Loaded += AdvancedSearchLoaded;

            var viewModel = new AdvancedSearchVM();
            viewModel.CloseAndLoadAccountAction = (accountNumber) => this.Close();
            
            this.DataContext = viewModel;

            if (DataContext is AdvancedSearchVM vm)
            {
                vm.FocusOnDataGridAction = () => FocusDataGrid();
            }
        }

        private void AdvancedSearchLoaded(object sender, RoutedEventArgs e)
        {
            var lastNameTextBox = FindName("LastNameTextBox") as TextBox;
            lastNameTextBox?.Focus();
        }

        private void FocusDataGrid()
        {
            if (advancedSearchResults.Items.Count > 0)
            {
                advancedSearchResults.Focus();
                advancedSearchResults.SelectedIndex = 0; // Optionally select the first row
            }
        }
    }
}