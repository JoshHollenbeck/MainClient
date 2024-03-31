using System;
using MainClient._Model;
using MainClient.Utilities;
using MainClient.Services;
using System.Collections.ObjectModel;
using System.Windows.Input;
using System.Windows;

namespace MainClient._ViewModel
{
    class ClientOverviewVM : ViewModelBase
    {
        private readonly IDialogService _dialogService;

        private ClientOverviewModel _clientDetails;

        public DateTime? CustDateOfBirth => _clientDetails?.CustDateOfBirth;
        public DateTime? CustClientSince => _clientDetails?.CustClientSince;
        public string CustFirstName => _clientDetails?.CustFirstName;
        public string CustMiddleName => _clientDetails?.CustMiddleName;
        public string CustLastName => _clientDetails?.CustLastName;
        public string CustSuffix => _clientDetails?.CustSuffix;
        public string CustPhoneHome => _clientDetails?.CustPhoneHome;
        public string CustPhoneBusiness => _clientDetails?.CustPhoneBusiness;
        public string CustEmail => _clientDetails?.CustEmail;
        public string CustAddress => _clientDetails?.CustAddress;
        public string CustAddress2 => _clientDetails?.CustAddress2;
        public string CustCity => _clientDetails?.CustCity;
        public string CustState => _clientDetails?.CustState;
        public string CustZip => _clientDetails?.CustZip;
        public bool? CustEmploymentStatus => _clientDetails?.CustEmploymentStatus;
        public string CustEmployer => _clientDetails?.CustEmployer;
        public string CustOccupation => _clientDetails?.CustOccupation;
        public string CustIDType => _clientDetails?.CustIDType;
        public string CustIDState => _clientDetails?.CustIDState;
        public string CustIDNum => _clientDetails?.CustIDNum;
        public string CustIDExp => _clientDetails?.CustIDExp;
        public string CustMothersMaiden => _clientDetails?.CustMothersMaiden;
        public bool? CustVoiceAuth => _clientDetails?.CustVoiceAuth;
        public bool? CustDoNotCall => _clientDetails?.CustDoNotCall;
        public bool? CustShareAffiliates => _clientDetails?.CustShareAffiliates;
        public string CustBranchCity => _clientDetails?.CustBranchCity;
        public string CustBranchState => _clientDetails?.CustBranchState;
        public string CustBranchZip => _clientDetails?.CustBranchZip;
        
        private ObservableCollection<ClientOverviewModel> _clientAccountResults = new ObservableCollection<ClientOverviewModel>();
        public ObservableCollection<ClientOverviewModel> ClientAccountResults
        {
            get  => _clientAccountResults;
            set
            {
                if (_clientAccountResults != value)
                {
                    _clientAccountResults = value;
                    OnPropertyChanged(nameof(ClientAccountResults));
                }
            }
        }

        private ObservableCollection<ClientOverviewModel> _clientNoteResults = new ObservableCollection<ClientOverviewModel>();
        public ObservableCollection<ClientOverviewModel> ClientNoteResults
        {
            get  => _clientNoteResults;
            set
            {
                if (_clientNoteResults != value)
                {
                    _clientNoteResults = value;
                    OnPropertyChanged(nameof(ClientNoteResults));
                }
            }
        }

        private ObservableCollection<ClientOverviewModel> _clientTransactionResults = new ObservableCollection<ClientOverviewModel>();
        public ObservableCollection<ClientOverviewModel> ClientTransactionResults
        {
            get  => _clientTransactionResults;
            set
            {
                if (_clientTransactionResults != value)
                {
                    _clientTransactionResults = value;
                    OnPropertyChanged(nameof(ClientTransactionResults));
                }
            }
        }

        public ClientOverviewVM(string accountNumber)
        {
            string acctNum = accountNumber;
            FetchClienttDetails(acctNum);
        }

        private void FetchClienttDetails(string acctNum)
        {
            _clientDetails = ClientOverviewModel.GetClientDetailsByAcctNum(acctNum);

            var clientAccountList = ClientOverviewModel.GetClientAcctsByAcctNum(acctNum);
            if (clientAccountList != null)
            {
                _clientAccountResults.Clear();
                foreach(var clientAccount in clientAccountList)
                {
                    _clientAccountResults.Add(clientAccount);
                }
            }

            var clientNoteList = ClientOverviewModel.GetClientNotesByAcctNum(acctNum);
            if (clientNoteList != null)
            {
                _clientNoteResults.Clear();
                foreach(var clientNote in clientNoteList)
                {
                    _clientNoteResults.Add(clientNote);
                }
            }

            var clientTransactionList = ClientOverviewModel.GetClientTransactionsByAcctNum(acctNum);
            if (clientTransactionList != null)
            {
                _clientTransactionResults.Clear();
                foreach(var accountPOA in clientTransactionList)
                {
                    _clientTransactionResults.Add(accountPOA);
                }
            }

            OnPropertyChanged(String.Empty);
        }

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
            // _dialogService.OpenDialog<MainClient._View.AddNotes>();
        }

        public ClientOverviewVM(IDialogService dialogService)
        {
            _dialogService = dialogService ?? throw new ArgumentNullException(nameof(dialogService));

            ViewNotesCommand = new RelayCommand(ViewNotes);
            AddNotesCommand = new RelayCommand(AddNotes);
            // TODO More Transactions Command
            // MoreTransactionsCommand
        }
    }
}
