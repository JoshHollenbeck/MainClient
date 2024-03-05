using System.Windows.Controls;
using MainClient._ViewModel;

namespace MainClient._View
{
    /// <summary>
    /// Represents a user control for displaying client overview information in a WPF application.
    /// This control is responsible for initializing the user interface and connecting it to the
    /// corresponding ViewModel (ClientOverviewVM) to facilitate data binding and interaction.
    /// </summary>

    public partial class ClientOverview : UserControl
    {
        public ClientOverview()
        {
            InitializeComponent();
            DataContext = new ClientOverviewVM();
        }
    }
}
