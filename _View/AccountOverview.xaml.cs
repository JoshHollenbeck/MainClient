using System.Windows.Controls;
using MainClient._ViewModel;

namespace MainClient._View
{
    /// <summary>
    /// Interaction logic for AccountOverview.xaml
    /// </summary>
    public partial class AccountOverview : UserControl
    {
        public AccountOverview()
        {
            InitializeComponent();
        }

        public void InitializeAccountOverviewVM(string accountNumber)
        {
            DataContext = new AccountOverviewVM(accountNumber);
        }
    }
}
