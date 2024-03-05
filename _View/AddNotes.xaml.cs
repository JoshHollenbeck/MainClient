using System.Windows;
using MainClient._ViewModel;

namespace MainClient._View
{
    /// <summary>
    /// Interaction logic for Transactions.xaml
    /// </summary>
    public partial class AddNotes : Window
    {
        public AddNotes()
        {
            InitializeComponent();
            DataContext = new AddNotesVM();
        }
    }
}
