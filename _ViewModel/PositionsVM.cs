using System;
using MainClient._Model;
using MainClient.Utilities;
using System.Collections.ObjectModel;

namespace MainClient._ViewModel
{
    class PositionsVM : ViewModelBase
    {
        private ObservableCollection<PositionsModel> _acctPositionResults = new ObservableCollection<PositionsModel>();
        public ObservableCollection<PositionsModel> AcctPositionResults
        {
            get  => _acctPositionResults;
            set 
            {
                if (_acctPositionResults != value)
                {
                    _acctPositionResults = value;
                    OnPropertyChanged(nameof(AcctPositionResults));
                }
            }
        }
        public PositionsVM(string accountNumber)
        {
            string acctNum = accountNumber;
            FetchHoldingDetails(acctNum);
        }

        private void FetchHoldingDetails(string acctNum)
        {
            var acctPositionList = PositionsModel.GetAcctHoldingsByAcctNum(acctNum);
            if (acctPositionList != null)
            {
                _acctPositionResults.Clear();
                foreach(var accountTrans in acctPositionList)
                {
                    _acctPositionResults.Add(accountTrans);
                }
            }

            OnPropertyChanged(String.Empty);
        }
    }
}
