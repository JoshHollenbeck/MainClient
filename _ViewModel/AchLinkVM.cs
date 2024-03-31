using System;
using System.Linq;
using MainClient._Model;
using MainClient.Utilities;
using MainClient.Services;
using System.Collections.ObjectModel;
using System.Windows.Input;
using System.Windows;


namespace MainClient._ViewModel
{
    class AchLinkVM : ViewModelBase
    {
        private ObservableCollection<AchLinkModel> _achBankResults =
            new ObservableCollection<AchLinkModel>();
        public ObservableCollection<AchLinkModel> AchBankResults
        {
            get => _achBankResults;
            set
            {
                if (_achBankResults != value)
                {
                    _achBankResults = value;
                    OnPropertyChanged(nameof(AchBankResults));
                }
            }
        }

        private ObservableCollection<AchLinkModel> _achBankTypeResults =
            new ObservableCollection<AchLinkModel>();
        public ObservableCollection<AchLinkModel> AchBankTypeResults
        {
            get => _achBankTypeResults;
            set
            {
                if (_achBankTypeResults != value)
                {
                    _achBankTypeResults = value;
                    OnPropertyChanged(nameof(AchBankTypeResults));
                }
            }
        }

        private ObservableCollection<AchLinkModel> _achLinkResults =
            new ObservableCollection<AchLinkModel>();
        public ObservableCollection<AchLinkModel> ACHLinkResults
        {
            get => _achLinkResults;
            set
            {
                if (_achLinkResults != value)
                {
                    _achLinkResults = value;
                    OnPropertyChanged(nameof(ACHLinkResults));
                }
            }
        }

        private ObservableCollection<AchLinkModel> _achTransactionResults =
            new ObservableCollection<AchLinkModel>();
        public ObservableCollection<AchLinkModel> ACHTransactionResults
        {
            get => _achTransactionResults;
            set
            {
                if (_achTransactionResults != value)
                {
                    _achTransactionResults = value;
                    OnPropertyChanged(nameof(ACHTransactionResults));
                }
            }
        }

        private ObservableCollection<AchLinkModel> _achPaymentListResults =
            new ObservableCollection<AchLinkModel>();
        public ObservableCollection<AchLinkModel> AchPaymentListResults
        {
            get => _achPaymentListResults;
            set
            {
                if (_achPaymentListResults != value)
                {
                    _achPaymentListResults = value;
                    OnPropertyChanged(nameof(AchPaymentListResults));
                }
            }
        }

        private void FetchAchDetails(string acctNum)
        {
            var bankAchList = AchLinkModel.LookUpBankRouting();
            if (bankAchList != null)
            {
                _achBankResults.Clear();
                foreach (var bankACH in bankAchList)
                {
                    _achBankResults.Add(bankACH);
                }
            }

            if (_achBankResults.Any())
            {
                SelectedBank = _achBankResults.First();
            }

            var bankAchTypeList = AchLinkModel.LookUpBankAcctType();
            if (bankAchTypeList != null)
            {
                _achBankTypeResults.Clear();
                foreach (var bankACHType in bankAchTypeList)
                {
                    _achBankTypeResults.Add(bankACHType);
                }
            }

            if (_achBankTypeResults.Any())
            {
                SelectedBankType = _achBankTypeResults.First();
            }

            var accountAchList = AchLinkModel.GetAcctAchLinksByAcctNum(acctNum);
            if (accountAchList != null)
            {
                _achLinkResults.Clear();
                foreach (var accountACH in accountAchList)
                {
                    _achLinkResults.Add(accountACH);
                }
            }

            var accountAchTransactionList = AchLinkModel.GetAcctTransactionsAchByAcctNum(acctNum);
            if (accountAchTransactionList != null)
            {
                _achTransactionResults.Clear();
                foreach (var accountAchTransaction in accountAchTransactionList)
                {
                    _achTransactionResults.Add(accountAchTransaction);
                }
            }

            var AchPaymentList = AchLinkModel.GetAcctAchListByAcctNum(acctNum);
            if (AchPaymentList != null)
            {
                _achPaymentListResults.Clear();
                foreach (var ACHPayment in AchPaymentList)
                {
                    _achPaymentListResults.Add(ACHPayment);
                }
            }

            if (_achPaymentListResults.Any())
            {
                SelectedAchPayment = _achPaymentListResults.First();
            }

            OnPropertyChanged(String.Empty);
        }

        private AchLinkModel _selectedBank;
        public AchLinkModel SelectedBank
        {
            get => _selectedBank;
            set
            {
                if (_selectedBank != value)
                {
                    _selectedBank = value;
                    OnPropertyChanged(nameof(SelectedBank));
                    UpdateACHRoutingNumber();
                }
            }
        }

        private AchLinkModel _selectedAchPayment;
        public AchLinkModel SelectedAchPayment
        {
            get => _selectedAchPayment;
            set
            {
                if (_selectedBank != value)
                {
                    _selectedAchPayment = value;
                    ACHRoutingNumber = _selectedAchPayment?.PaymentRouting;
                    ACHAccountNumber = _selectedAchPayment?.PaymentAcctNum;
                    OnPropertyChanged(nameof(SelectedAchPayment));
                    OnPropertyChanged(nameof(ACHRoutingNumber));
                    OnPropertyChanged(nameof(ACHAccountNumber));
                }
            }
        }

        private AchLinkModel _selectedBankType;
        public AchLinkModel SelectedBankType
        {
            get => _selectedBankType;
            set
            {
                if (_selectedBankType != value)
                {
                    _selectedBankType = value;
                    OnPropertyChanged(nameof(SelectedBankType));
                }
            }
        }

        private void UpdateACHRoutingNumber()
        {
            ACHRoutingNumber = SelectedBank?.LUAchRoutingNumber;
        }

        private string _achRoutingNumber;
        public string ACHRoutingNumber
        {
            get => _achRoutingNumber;
            set
            {
                if (_achRoutingNumber != value)
                {
                    _achRoutingNumber = value;
                    OnPropertyChanged(nameof(ACHRoutingNumber));
                }
            }
        }

        public string NewAchAccountNumber { get; set;}
        public string NewAchNickname { get; set;}

        private void ExecuteAddAchLink(object parameter)
        {
            string accountNumber = AccountService.Instance.SelectedAccountNumber;
            string repId = RepIdService.Instance.RepId;

            try
            {
                AchLinkModel.InsertAcctAchSetupByAcctNum(accountNumber, SelectedBank?.LUAchRoutingNumber, NewAchAccountNumber, SelectedBankType?.AchBankType, NewAchNickname, repId);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Failed to add new ACH link: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private decimal? _achPaymentAmount;

        public decimal? ACHPaymentAmount
        {
            get { return _achPaymentAmount; }
            set
            {
                if (_achPaymentAmount != value)
                {
                    _achPaymentAmount = value;
                    OnPropertyChanged(nameof(ACHPaymentAmount));
                }
            }
        }

        private string _achAccountNumber;
        public string ACHAccountNumber
        {
            get { return _achAccountNumber; }
            set
            {
                _achAccountNumber = value;
                OnPropertyChanged(nameof(ACHAccountNumber));
            }
        }

        private void ExecuteAddAchPayment(object parameter)
        {
            string accountNumber = AccountService.Instance.SelectedAccountNumber;
            string repId = RepIdService.Instance.RepId;
            
            if(string.IsNullOrEmpty(ACHAccountNumber))
            {
                MessageBox.Show("Account number must be provided.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            try
            {
                AchLinkModel.InsertAcctTransactionAchByAcctNum(accountNumber, ACHRoutingNumber, ACHAccountNumber, ACHPaymentAmount, repId);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Failed to make ACH payment: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public ICommand AddAchLinkCommand { get; }
        public ICommand AddAchPaymentCommand { get; }
        
        public AchLinkVM(string accountNumber)
        {
            string acctNum = accountNumber;
            FetchAchDetails(acctNum);
            AddAchLinkCommand = new RelayCommand(ExecuteAddAchLink);
            AddAchPaymentCommand = new RelayCommand(ExecuteAddAchPayment);

        }
    }
}
