using System;
using System.Windows;
using MainClient.Utilities;
using System.Windows.Input;
using MainClient._View;
using MainClient.Services;
using MainClient._Model;
using System.Collections.ObjectModel;
using System.Windows.Data;
using System.Linq;

namespace MainClient._ViewModel
{
    class MainWindowVM : ViewModelBase 
    {
        private readonly IDialogService _dialogService;

        // Startup
        public ICommand HomeCommand { get; }

        private void Home(object obj) => CurrentView = new HomeVM();

        // File
        public ICommand NewSessionCommand { get; }
        public ICommand PrintPreviewCommand { get; }
        public ICommand PrintCommand { get; }
        public ICommand ExitCommand { get; }

        private void NewSession()
        {
            CurrentView = new MainWindowVM();
        }

        private void PrintPreview(object obj) => CurrentView = new PrintPreviewVM();

        private void Print(object obj) => CurrentView = new PrintVM();

        // Clients
        public ICommand AddClientCommand { get; }

        private void AddClient(object obj) => CurrentView = new AddClientVM();

        // Help
        public ICommand MainClientKnowledgeCommand { get; }
        public ICommand TipsAndTricksCommand { get; }

        private void MainClientKnowledge(object obj) => CurrentView = new MainClientKnowledgeVM();

        private void TipsAndTricks(object obj) => CurrentView = new TipsAndTricksVM();

        // Search
        private string _searchText;
        public string SearchText
        {
            get { return _searchText; }
            set
            {
                if (_searchText != value)
                {
                    _searchText = value;
                    OnPropertyChanged("SearchText");
                }
            }
        }
        public ICommand SearchCommand { get; }

         private void Search(object obj)
        {
            SearchWindow searchWindow = new SearchWindow(_searchText);
            searchWindow.Show();
        }

        // Advanced Search
        public ICommand AdvancedSearchCommand { get; private set; }
        
        private void AdvancedSearch(object obj)
        {
            if (!RepIdService.Instance.Trading && !RepIdService.Instance.MoveMoney && !RepIdService.Instance.ViewOnly)
            {
                MessageBox.Show("You do not have the necessary permissions to search.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var advancedSearchWindow = new AdvancedSearch();
            var advancedSearchVM = advancedSearchWindow.DataContext as AdvancedSearchVM;
            if (advancedSearchVM != null)
            {
                advancedSearchVM.CloseAndLoadAccountAction = (accountNumber) =>
                {
                    AccountService.Instance.SelectedAccountNumber = accountNumber;
                    advancedSearchWindow.Close();
                    Application.Current.Dispatcher.Invoke(() =>
                    {
                        AccountOverview(AccountService.Instance.SelectedAccountNumber);
                    });
                };
            }
            advancedSearchWindow.Show();
        }

        // Client & Accounts
        public ICommand ClientOverviewCommand { get; }
        public ICommand AccountOverviewCommand { get; }
        public ICommand PositionsCommand { get; }
        public ICommand TransactionsCommand { get; }
        public ICommand AccessHistoryCommand { get; }

        private void ClientOverview(object obj)
        {   
            var accountNumber = AccountService.Instance.SelectedAccountNumber;
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (!RepIdService.Instance.Trading && !RepIdService.Instance.MoveMoney && !RepIdService.Instance.ViewOnly)
                {
                    MessageBox.Show("You do not have the necessary permissions to view clients.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return; // Exit the method if no permissions are granted
                }
                
                LoadViewModel(accountNumber, accNum => new ClientOverviewVM(accNum));
            }
        }

        private void AccountOverview(object obj)
        {
            var accountNumber = AccountService.Instance.SelectedAccountNumber;

            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (!RepIdService.Instance.Trading && !RepIdService.Instance.MoveMoney && !RepIdService.Instance.ViewOnly)
                {
                    MessageBox.Show("You do not have the necessary permissions to view accounts.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return; // Exit the method if no permissions are granted
                }

                var clientNameModel = MainWindowModel.GetClientNameByAcctNum(accountNumber);
                
                if (clientNameModel != null)
                {
                    ClientFullName = clientNameModel.ClientFullName;
                }

                var clientAccountList = MainWindowModel.GetClientAcctListByAcctNum(accountNumber);
        
                if (clientAccountList != null)
                {
                    MainWindowModel currentAccount = null;
                    Application.Current.Dispatcher.Invoke(() =>
                    {
                        _clientAcctsResults.Clear();
                        foreach (var accountList in clientAccountList)
                        {
                            
                            _clientAcctsResults.Add(accountList);

                            if (accountList.ClientAcctAndName.StartsWith(accountNumber))
                            {
                                currentAccount = accountList;
                            }
                        }

                        var collectionView = CollectionViewSource.GetDefaultView(_clientAcctsResults);
     
                        if (collectionView != null && currentAccount != null)
                        {
                            collectionView.MoveCurrentTo(currentAccount);
                        }
                    });
                }
                LoadViewModel(accountNumber, accNum => new AccountOverviewVM(accNum));
            }
        }

        private void Positions(object obj)
        {
            var accountNumber = AccountService.Instance.SelectedAccountNumber;
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (!RepIdService.Instance.Trading && !RepIdService.Instance.MoveMoney && !RepIdService.Instance.ViewOnly)
                {
                    MessageBox.Show("You do not have the necessary permissions to view positions.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                LoadViewModel(accountNumber, accNum => new PositionsVM(accNum));
            }
        }

        private void Transactions(object obj)
        { 
            var accountNumber = AccountService.Instance.SelectedAccountNumber;
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (!RepIdService.Instance.Trading && !RepIdService.Instance.MoveMoney && !RepIdService.Instance.ViewOnly)
                {
                    MessageBox.Show("You do not have the necessary permissions to view transactions.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return; // Exit the method if no permissions are granted
                }

                LoadViewModel(accountNumber, accNum => new TransactionsVM(accNum));
            }
        }

        private void AccessHistory(object obj) 
        {
            var accountNumber = AccountService.Instance.SelectedAccountNumber;
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (!RepIdService.Instance.Trading && !RepIdService.Instance.MoveMoney && !RepIdService.Instance.ViewOnly)
                {
                    MessageBox.Show("You do not have the necessary permissions to view transactions.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return; // Exit the method if no permissions are granted
                }

                LoadViewModel(accountNumber, accNum => new AccessHistoryVM(accNum));
            }
        }

        // Notes
        public ICommand ViewNotesCommand { get; }
        private void ViewNotes(object obj) 
        {
            var accountNumber = AccountService.Instance.SelectedAccountNumber;
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (!RepIdService.Instance.Trading && !RepIdService.Instance.MoveMoney && !RepIdService.Instance.ViewOnly)
                {
                    MessageBox.Show("You do not have the necessary permissions to view transactions.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return; // Exit the method if no permissions are granted
                }

                LoadViewModel(accountNumber, accNum => new ViewNotesVM(accNum));
            }
        }

        public ICommand AddNotesCommand { get; private set; }
        
        private void AddNotes(object obj)
        {
            if (!RepIdService.Instance.Trading && !RepIdService.Instance.MoveMoney)
            {
                MessageBox.Show("You do not have the necessary permissions to add notes.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                return; // Exit the method if no permissions are granted
            }
            
            var accountNumber = AccountService.Instance.SelectedAccountNumber;
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                // TODO ADD NOTES
                _dialogService.OpenDialog<MainClient._View.AddNotes>();
            }
        }

        // Cashiering
        public ICommand ActivityCommand { get; }
        public ICommand AccountDepositCommand { get; }
        public ICommand AchLinkCommand { get; }

        private void Activity(object obj) => CurrentView = new ActivityVM();

        private void AccountDeposit(object obj)
        {
            var accountNumber = AccountService.Instance.SelectedAccountNumber;
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (!RepIdService.Instance.MoveMoney && !RepIdService.Instance.ViewOnly)
                {
                    MessageBox.Show("You do not have the necessary permissions to deposit into account.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return; // Exit the method if no permissions are granted
                }

                LoadViewModel(accountNumber, accNum => new AccountDepositVM(accNum));
            }
        }

        private void AchLink(object obj)
        {
            var accountNumber = AccountService.Instance.SelectedAccountNumber;
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (!RepIdService.Instance.MoveMoney && !RepIdService.Instance.ViewOnly)
                {
                    MessageBox.Show("You do not have the necessary permissions to view transactions.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return; // Exit the method if no permissions are granted
                }

                LoadViewModel(accountNumber, accNum => new AchLinkVM(accNum));
            }
        }

        // Trading
        public ICommand OrderEntryCommand { get; }
        public ICommand OrderStatusCommand { get; }

        private void OrderEntry(object obj)
        {
            if (!RepIdService.Instance.Trading)
            {
                MessageBox.Show("You do not have permission to enter orders.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            CurrentView = new OrderEntryVM();
        }

        private void OrderStatus(object obj)
        {
            if (!RepIdService.Instance.Trading)
            {
                MessageBox.Show("You do not have permission to enter orders.", "Permission Denied", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            CurrentView = new OrderStatusVM();
        }

        // Settings
        public ICommand SettingsCommand { get; }

        private void Setting(object obj) => CurrentView = new SettingsVM();
        
        // Random Word
        private string _newWord;

        public string NewWord
        {
            get { return _newWord; }
            set
            {
                if (_newWord != value)
                {
                    _newWord = value;
                    OnPropertyChanged(nameof(NewWord));
                }
            }
        }

        public ICommand GetRandomWordCommand { get; }

        private void FetchRandomWord()
        {
            var randomWordModel = MainClient._Model.MainWindowModel.GetRandomWord();
            if (randomWordModel != null)
            {
                NewWord = randomWordModel.NewWord;
            }
        }

        // Get Client Name

        private string _clientFullName;
        public string ClientFullName
        {
            get => _clientFullName;
            set
            {
                _clientFullName = value;
                OnPropertyChanged(nameof(ClientFullName));
            }
        }

        // Get Client Accts List
        private ObservableCollection<MainWindowModel> _clientAcctsResults = new ObservableCollection<MainWindowModel>();
        public ObservableCollection<MainWindowModel> ClientAcctsResults
        {
            get  => _clientAcctsResults;
            set
            {
                if (_clientAcctsResults != value)
                {
                    _clientAcctsResults = value;
                    OnPropertyChanged(nameof(ClientAcctsResults));;
                }
            }
        }

        private MainWindowModel _selectedClientAccount;
        public MainWindowModel SelectedClientAccount
        {
            get => _selectedClientAccount;
            set
            {
                if (_selectedClientAccount != value)
                {
                    _selectedClientAccount = value;
                    OnPropertyChanged(nameof(SelectedClientAccount));
                }
            }
        }

        // TODO Account isn't showing up in Combobox
        public void HandleSelectionChange(MainWindowModel selectedAccount)
        {
            SelectedClientAccount = selectedAccount; // This property is now being used and should update the ComboBox via the binding.
            var parts = selectedAccount.ClientAcctAndName.Split(new string[] { " - " }, StringSplitOptions.None);
            var accountNumber = parts.Length > 0 ? parts[0] : string.Empty;
            
            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (string.IsNullOrEmpty(accountNumber))
            {
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var clientNameModel = MainWindowModel.GetClientNameByAcctNum(accountNumber);

            if (clientNameModel != null)
            {
                ClientFullName = clientNameModel.ClientFullName;
            }

            var clientAccountList = MainWindowModel.GetClientAcctListByAcctNum(accountNumber);
            
            SelectedClientAccount = clientAccountList.FirstOrDefault(account => account.ClientAcctAndName.StartsWith(accountNumber));

            if (clientAccountList != null)
            {
                Application.Current.Dispatcher.Invoke(() =>
                {
                    _clientAcctsResults.Clear();
                    foreach (var accountList in clientAccountList)
                    {
                        _clientAcctsResults.Add(accountList);
                    }

                    var collectionView = CollectionViewSource.GetDefaultView(_clientAcctsResults);
     
                    if (collectionView != null && _clientAcctsResults != null)
                    {
                        collectionView.MoveCurrentTo(selectedAccount);
                    }
                });
            }
            LoadViewModel(accountNumber, accNum => new AccountOverviewVM(accNum));
        }
        
        // IDialog Service
        public MainWindowVM(IDialogService dialogService)
        {

            _dialogService = dialogService ?? throw new ArgumentNullException(nameof(dialogService));
            
            // Startup Page
            HomeCommand = new RelayCommand(Home);
            CurrentView = new HomeVM();
            // File
            NewSessionCommand = new RelayCommand(Home);
            PrintPreviewCommand = new RelayCommand(PrintPreview);
            PrintCommand = new RelayCommand(Print);
            MainClientKnowledgeCommand = new RelayCommand(MainClientKnowledge);
            TipsAndTricksCommand = new RelayCommand(TipsAndTricks);
            // Client
            AddClientCommand = new RelayCommand(AddClient);
            // Search
            SearchCommand = new RelayCommand(Search);
            // Advanced Search
            AdvancedSearchCommand = new RelayCommand(AdvancedSearch);
            // Client & Accounts
            ClientOverviewCommand = new RelayCommand(ClientOverview);
            AccountOverviewCommand = new RelayCommand(AccountOverview);
            PositionsCommand = new RelayCommand(Positions);
            TransactionsCommand = new RelayCommand(Transactions);
            AccessHistoryCommand = new RelayCommand(AccessHistory);
            // Notes
            ViewNotesCommand = new RelayCommand(ViewNotes);
            AddNotesCommand = new RelayCommand(AddNotes);
            // Cashiering
            ActivityCommand = new RelayCommand(Activity);
            AccountDepositCommand = new RelayCommand(AccountDeposit);
            AchLinkCommand = new RelayCommand(AchLink);
            // Trading
            OrderEntryCommand = new RelayCommand(OrderEntry);
            OrderStatusCommand = new RelayCommand(OrderStatus);
            // Settings
            SettingsCommand = new RelayCommand(Setting);
            // Random Word
            GetRandomWordCommand = new RelayCommand(o => FetchRandomWord());
            FetchRandomWord();
        }

        public MainWindowVM()
        {
        }
    }
}