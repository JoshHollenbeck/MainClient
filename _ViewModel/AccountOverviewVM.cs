using System;
using MainClient._Model;
using System.ComponentModel;

namespace MainClient._ViewModel
{
    class AccountOverviewVM : INotifyPropertyChanged
    {
        private AccountOverviewModel _accountDetails;

        public event PropertyChangedEventHandler PropertyChanged;

        // Properties to bind to the view
        public string RegistrationName => _accountDetails?.RegistrationName;
        public string InitialContactMethod => _accountDetails?.InitialContactMethod;
        public string AccountType => _accountDetails?.AccountType;
        public string ClientFirstName => _accountDetails?.ClientFirstName;
        public string ClientMiddleName => _accountDetails?.ClientMiddleName;
        public string ClientLastName => _accountDetails?.ClientLastName;
        public string ClientSuffix => _accountDetails?.ClientSuffix;
        public string ClientAddress => _accountDetails?.ClientAddress;
        public string ClientAddress2 => _accountDetails?.ClientAddress2;
        public string ClientCity => _accountDetails?.ClientCity;
        public string ClientState => _accountDetails?.ClientState;
        public string ClientZip => _accountDetails?.ClientZip;
        public string ClientCountry => _accountDetails?.ClientCountry;
        public string PrimaryContactName => _accountDetails?.PrimaryContactName;
        public string PrimaryContactAddress => _accountDetails?.PrimaryContactAddress;
        public string PrimaryContactAddress2 => _accountDetails?.PrimaryContactAddress2;
        public string PrimaryContactCity => _accountDetails?.PrimaryContactCity;
        public string PrimaryContactState => _accountDetails?.PrimaryContactState;
        public string PrimaryContactZip => _accountDetails?.PrimaryContactZip;
        public string RepID => _accountDetails?.RepID;
        public DateTime? EstablishedDate => _accountDetails?.EstablishedDate;
        public bool? AccountStatus => _accountDetails?.AccountStatus;
        public string JurisdictionCountry => _accountDetails?.JurisdictionCountry;
        public string JurisdictionState => _accountDetails?.JurisdictionState;
        public string AccountPassword => _accountDetails?.AccountPassword;
        public string BranchLocation => _accountDetails?.BranchLocation;
        public string CustTaxId => _accountDetails?.CustTaxId;
        public int? AtmLimit => _accountDetails?.AtmLimit;
        public int? AchLimit => _accountDetails?.AchLimit;
        public int? WireLimit => _accountDetails?.WireLimit;
        public string EmailAddress => _accountDetails?.EmailAddress;
        public bool? WebBanking => _accountDetails?.WebBanking;
        public bool? MobileBanking => _accountDetails?.MobileBanking;
        public bool? TwoFactor => _accountDetails?.TwoFactor;
        public bool? Biometrics => _accountDetails?.Biometrics;
        public int? AcctObjective => _accountDetails?.AcctObjective;
        public int? AcctFunding => _accountDetails?.AcctFunding;
        public int? AcctPurpose => _accountDetails?.AcctPurpose;      
        public int? AcctActivity => _accountDetails?.AcctActivity;
        public string POAFirstName => _accountDetails?.POAFirstName;
        public string POALastName => _accountDetails?.POALastName;
        public string POARole => _accountDetails?.POARole;
        public string POACustomerID => _accountDetails?.POACustomerID;
        public string POATaxID => _accountDetails?.POATaxID;


        public AccountOverviewVM(string accountNumber)
        {
            string acctNum = accountNumber;
            FetchAccountDetails(acctNum);
        }

        private void FetchAccountDetails(string acctNum)
        {
            _accountDetails = AccountOverviewModel.GetAccountDetailsByAcctNum(acctNum);
            NotifyPropertyChanged(String.Empty);
        }

        protected void NotifyPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}