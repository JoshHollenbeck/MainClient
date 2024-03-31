using System;
using MainClient._Model;
using MainClient.Utilities;
using System.Collections.ObjectModel;

namespace MainClient._ViewModel
{
    class TransactionsVM : ViewModelBase
    {
        private ObservableCollection<TransactionsModel> _acctTransactionResults = new ObservableCollection<TransactionsModel>();
        public ObservableCollection<TransactionsModel> AcctTransactionResults
        {
            get  => _acctTransactionResults;
            set
            {
                if (_acctTransactionResults != value)
                {
                    _acctTransactionResults = value;
                    OnPropertyChanged(nameof(AcctTransactionResults));
                }
            }
        }
        public TransactionsVM(string accountNumber)
        {
            string acctNum = accountNumber;
            FetchTransactionDetails(acctNum);
        }

        private void FetchTransactionDetails(string acctNum)
        {
            var acctTransactionList = TransactionsModel.GetAcctTransactionsByAcctNum(acctNum);
            if (acctTransactionList != null)
            {
                _acctTransactionResults.Clear();
                foreach(var accountTrans in acctTransactionList)
                {
                    _acctTransactionResults.Add(accountTrans);
                }
            }

            OnPropertyChanged(String.Empty);
        }
    }
}
