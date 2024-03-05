using MainClient._Model;
using MainClient.Utilities;

namespace MainClient._ViewModel
{
    class AddClientVM : ViewModelBase
    {
        private AddClientModel addClient;
        public AddClientVM()
        {
            addClient = new AddClientModel(); // Initialize the instance
            addClient.LoadTypes();
        }
    }
}
