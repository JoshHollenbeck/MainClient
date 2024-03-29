﻿using System.Windows;
using System.Collections.ObjectModel;
using System.Windows.Input;
using MainClient._Model;
using MainClient.Utilities;

using System;

namespace MainClient._ViewModel
{
    class AdvancedSearchVM : ViewModelBase
    {
        private readonly AdvancedSearchModel _searchService;

        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string MiddleInitial { get; set; }
        public string CustSecondaryId { get; set; }
        public string CustPhone { get; set; }
        public string CustTaxId { get; set; }
        public string CustZip { get; set; }
        public string AcctNum { get; set; }
        public string CustEmail { get; set; }

        private ObservableCollection<AdvancedSearchModel.SearchResult> _searchResults;
        
        public ObservableCollection<AdvancedSearchModel.SearchResult> SearchResults
        {
            get { return _searchResults; }
            set
            {
                _searchResults = value;
                OnPropertyChanged(nameof(SearchResults)); // Assuming OnPropertyChanged is implemented in ViewModelBase
            }
        }

        public AdvancedSearchVM()
        {
            _searchService = new AdvancedSearchModel();
            SearchResults = new ObservableCollection<AdvancedSearchModel.SearchResult>();
            PerformSearchCommand = new RelayCommand(ExecuteSearch);
            OpenAccountOverviewCommand = new RelayCommand(OpenAccountOverview);
        }

        public ICommand PerformSearchCommand { get; private set; }

        public Action FocusOnDataGridAction { get; set; }

        private void ExecuteSearch(object parameter)
        {
            PerformSearch(
                lastName: this.LastName,
                firstName: this.FirstName,
                middleInitial: this.MiddleInitial,
                custSecondaryId: this.CustSecondaryId,
                custPhone: this.CustPhone,
                custZip: this.CustZip,
                custTaxId: this.CustTaxId,
                acctNum: this.AcctNum,
                custEmail: this.CustEmail
            );
        }

        // Method to perform the search and update SearchResults
        public void PerformSearch(
            string lastName,
            string firstName,
            string middleInitial,
            string custSecondaryId,
            string custPhone,
            string custZip,
            string custTaxId,
            string acctNum,
            string custEmail
        )
        {
            var results = _searchService.AcctAdvancedSearch(
                lastName,
                firstName,
                middleInitial,
                custSecondaryId,
                custPhone,
                custZip,
                custTaxId,
                acctNum,
                custEmail
            );
           Application.Current.Dispatcher.Invoke(() =>
            {
                SearchResults.Clear();
                foreach (var result in results)
                {
                    SearchResults.Add(result);
                }

                FocusOnDataGridAction?.Invoke();
            });
        }

        private AdvancedSearchModel.SearchResult _selectedItem;
        
        public AdvancedSearchModel.SearchResult SelectedItem
        {
            get => _selectedItem;
            set
            {
                _selectedItem = value;
                OnPropertyChanged(nameof(SelectedItem));
            }
        }

        public Action<string> CloseAndLoadAccountAction { get; set; }

        public ICommand OpenAccountOverviewCommand { get; private set; }

        public void OpenAccountOverview(object parameter)
        {
            if (SelectedItem != null)
            {
                CloseAndLoadAccountAction?.Invoke(SelectedItem.AccountNumber);
            }
            else
            {
                MessageBox.Show("No item selected");
            }
        }
    }
}
 