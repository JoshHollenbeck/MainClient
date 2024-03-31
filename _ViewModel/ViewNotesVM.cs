using System;
using MainClient._Model;
using MainClient.Utilities;
using System.Collections.ObjectModel;

namespace MainClient._ViewModel
{
    class ViewNotesVM : ViewModelBase
    {
        private ObservableCollection<ViewNotesModel> _acctNoteResults = new ObservableCollection<ViewNotesModel>();
        public ObservableCollection<ViewNotesModel> AcctNoteResults
        {
            get  => _acctNoteResults;
            set
            {
                if (_acctNoteResults != value)
                {
                    _acctNoteResults = value;
                    OnPropertyChanged(nameof(AcctNoteResults));
                }
            }
        }

        public ViewNotesVM(string accountNumber)
        {
            string acctNum = accountNumber;
            FetchNotesDetails(acctNum);
        }

        private void FetchNotesDetails(string acctNum)
        {
            var acctNoteList = ViewNotesModel.GetAcctNotesByAcctNum(acctNum);
            if (acctNoteList != null)
            {
                _acctNoteResults.Clear();
                foreach(var accountNote in acctNoteList)
                {
                    _acctNoteResults.Add(accountNote);
                }
            }

            OnPropertyChanged(String.Empty);
        }
    }
}
