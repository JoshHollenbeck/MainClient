using System.Windows.Controls;
using MainClient._ViewModel;

namespace MainClient._View
{
    /// <summary>
    /// Interaction logic for Transactions.xaml
    /// </summary>
    public partial class Transactions : UserControl
    {
        public Transactions()
        {
            InitializeComponent();
            DataContext = new TransactionsVM();
        }
    }
}
