using System;
using System.Windows;
using MainClient.Utilities;
using System.Windows.Input;
using MainClient._View;
using MainClient.Services;

namespace MainClient._ViewModel
{
    class MainWindowVM : ViewModelBase 
    {
        private IDialogService _dialogService;
        private object _currentView;
        public object CurrentView
        {
            get { return _currentView; }
            set
            {
                _currentView = value;
                OnPropertyChanged();
            }
        }

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

        public void ShowAccountOverview(string accountNumber)
        {
            CurrentView = new AccountOverviewVM(accountNumber);
        }

        private string selectedAccountNumber;
        
        private void AdvancedSearch(object obj)
        {
            var advancedSearchWindow = new AdvancedSearch();
            var advancedSearchVM = advancedSearchWindow.DataContext as AdvancedSearchVM;
            if (advancedSearchVM != null)
            {
                // Assuming AdvancedSearchVM has a property to set the CloseAction or a similar mechanism
                advancedSearchVM.CloseAndLoadAccountAction = (accountNumber) =>
                {
                    selectedAccountNumber = accountNumber; // Capture the selected account number
                    advancedSearchWindow.Close();
                    Application.Current.Dispatcher.Invoke(() =>
                    {
                        AccountOverview(selectedAccountNumber); // Pass the account number to the method
                    });
                };
            }
            advancedSearchWindow.Show();
        }

        // Client & Accounts
        public ICommand ClientOverviewCommand { get; }
        public ICommand AccountOverviewCommand { get; }
        public ICommand BalancesCommand { get; }
        public ICommand PositionsCommand { get; }
        public ICommand TransactionsCommand { get; }
        public ICommand AccessHistoryCommand { get; }

        private void ClientOverview(object obj) => CurrentView = new ClientOverviewVM();

        private void AccountOverview(object obj)
        {
            var accountNumber = obj as string;
            // Check if the accountNumber is null or empty
            if (string.IsNullOrEmpty(accountNumber))
            {
                // Using MessageBox.Show to inform the user
                MessageBox.Show("No account selected", "Selection Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                // Proceed with loading AccountOverviewVM with the provided accountNumber
                CurrentView = new AccountOverviewVM(accountNumber);
            }
        }

        private void Balances(object obj) => CurrentView = new BalancesVM();

        private void Positions(object obj) => CurrentView = new PositionsVM();

        private void Transactions(object obj) => CurrentView = new TransactionsVM();

        // Notes
        public ICommand ViewNotesCommand { get; }
        private void ViewNotes(object obj) => CurrentView = new ViewNotesVM();

        public ICommand AddNotesCommand { get; private set; }
        
        private void AddNotes(object obj)
        {
            _dialogService.OpenDialog<AddNotes>();
        }

        // Cashiering
        public ICommand ActivityCommand { get; }
        public ICommand HistoryCommand { get; }
        public ICommand AccountDepositCommand { get; }
        public ICommand SplitDepositCommand { get; }
        public ICommand AchLinkCommand { get; }

        private void Activity(object obj) => CurrentView = new ActivityVM();

        private void History(object obj) => CurrentView = new HistoryVM();

        private void AccountDeposit(object obj) => CurrentView = new AccountDepositVM();

        private void SplitDeposit(object obj) => CurrentView = new SplitDepositVM();

        private void AchLink(object obj) => CurrentView = new AchLinkVM();

        // Trading
        public ICommand OrderEntryCommand { get; }
        public ICommand OrderStatusCommand { get; }

        private void OrderEntry(object obj) => CurrentView = new OrderEntryVM();

        private void OrderStatus(object obj) => CurrentView = new OrderStatusVM();

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
                    OnPropertyChanged(); // Assumes CallerMemberName is being used
                }
            }
        }

        public ICommand GetRandomWordCommand { get; private set; }

        private void ExecuteGetRandomWord()
        {
            var randomWordModel = MainClient._Model.MainWindowModel.GetRandomWord();
            if (randomWordModel != null)
            {
                NewWord = randomWordModel.NewWord;
            }
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
            BalancesCommand = new RelayCommand(Balances);
            PositionsCommand = new RelayCommand(Positions);
            TransactionsCommand = new RelayCommand(Transactions);
            // Notes
            ViewNotesCommand = new RelayCommand(ViewNotes);
            AddNotesCommand = new RelayCommand(AddNotes);
            // Cashiering
            ActivityCommand = new RelayCommand(Activity);
            HistoryCommand = new RelayCommand(History);
            AccountDepositCommand = new RelayCommand(AccountDeposit);
            SplitDepositCommand = new RelayCommand(SplitDeposit);
            AchLinkCommand = new RelayCommand(AchLink);
            // Trading
            OrderEntryCommand = new RelayCommand(OrderEntry);
            OrderStatusCommand = new RelayCommand(OrderStatus);
            // Settings
            SettingsCommand = new RelayCommand(Setting);
            // Random Word
            GetRandomWordCommand = new RelayCommand(o => ExecuteGetRandomWord());
            ExecuteGetRandomWord();
        }

        public MainWindowVM()
        {            
        }
    }
}