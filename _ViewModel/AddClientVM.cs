using System;
using MainClient.Utilities;
using MainClient._Model;
using System.Collections.ObjectModel;
using System.Linq;

namespace MainClient._ViewModel
{
    class AddClientVM : ViewModelBase
    {
        private ObservableCollection<AddClientModel> _idResults =
            new ObservableCollection<AddClientModel>();
        public ObservableCollection<AddClientModel> IdResults
        {
            get => _idResults;
            set
            {
                if (_idResults != value)
                {
                    _idResults = value;
                    OnPropertyChanged(nameof(IdResults));
                    ;
                }
            }
        }

        private ObservableCollection<AddClientModel> _stateResults =
            new ObservableCollection<AddClientModel>();
        public ObservableCollection<AddClientModel> StateResults
        {
            get => _stateResults;
            set
            {
                if (_stateResults != value)
                {
                    _stateResults = value;
                    OnPropertyChanged(nameof(StateResults));
                    ;
                }
            }
        }

        private ObservableCollection<string> _months;
        public ObservableCollection<string> Months
        {
            get { return _months; }
            set
            {
                _months = value;
                OnPropertyChanged(nameof(Months));
            }
        }

        private ObservableCollection<int> _days;
        public ObservableCollection<int> Days
        {
            get { return _days; }
            set
            {
                _days = value;
                OnPropertyChanged(nameof(Days));
            }
        }

        private ObservableCollection<int> _years;
        public ObservableCollection<int> Years
        {
            get { return _years; }
            set
            {
                _years = value;
                OnPropertyChanged(nameof(Years));
            }
        }

        private ObservableCollection<int> _expYears;
        public ObservableCollection<int> ExpYears
        {
            get { return _expYears; }
            set
            {
                _expYears = value;
                OnPropertyChanged(nameof(ExpYears));
            }
        }

        private string _selectedMonth;
        public string SelectedMonth
        {
            get { return _selectedMonth; }
            set
            {
                if (_selectedMonth != value)
                {
                    _selectedMonth = value;
                    OnPropertyChanged(nameof(SelectedMonth));
                    UpdateDays();
                }
            }
        }

        private int _selectedDay;
        public int SelectedDay
        {
            get { return _selectedDay; }
            set
            {
                _selectedDay = value;
                OnPropertyChanged(nameof(SelectedDay));
            }
        }

        private int _selectedYear;
        public int SelectedYear
        {
            get { return _selectedYear; }
            set
            {
                if (_selectedYear != value)
                {
                    _selectedYear = value;
                    OnPropertyChanged(nameof(SelectedYear));
                    UpdateDays();
                }
            }
        }

        private void UpdateDays()
        {
            if (!string.IsNullOrEmpty(SelectedMonth))
            {
                int daysInMonth = DateTime.DaysInMonth(
                    SelectedYear,
                    MonthStringToNumber(SelectedMonth)
                );
                Days = new ObservableCollection<int>(Enumerable.Range(1, daysInMonth));
            }
            else
            {
                SelectedMonth = "January";
                SelectedIdMonth = "January";
            }
        }

        private int MonthStringToNumber(string month)
        {
            return month switch
            {
                "January" => 1,
                "February" => 2,
                "March" => 3,
                "April" => 4,
                "May" => 5,
                "June" => 6,
                "July" => 7,
                "August" => 8,
                "September" => 9,
                "October" => 10,
                "November" => 11,
                "December" => 12,
                _
                    => throw new ArgumentOutOfRangeException(
                        nameof(month),
                        $"Not expected month value: {month}"
                    )
            };
        }

        private string _selectedIdMonth;
        public string SelectedIdMonth
        {
            get { return _selectedIdMonth; }
            set
            {
                _selectedIdMonth = value;
                OnPropertyChanged(nameof(SelectedIdMonth));
            }
        }

        private int _selectedExpYear;
        public int SelectedExpYear
        {
            get { return _selectedExpYear; }
            set
            {
                if (_selectedExpYear != value)
                {
                    _selectedExpYear = value;
                    OnPropertyChanged(nameof(SelectedExpYear));
                }
            }
        }

        private AddClientModel _selectedIdType;
        public AddClientModel SelectedIdType
        {
            get => _selectedIdType;
            set
            {
                if (_selectedIdType != value)
                {
                    _selectedIdType = value;
                    OnPropertyChanged(nameof(SelectedIdType));
                }
            }
        }

        private AddClientModel _selectedIdState;
        public AddClientModel SelectedIdState
        {
            get { return _selectedIdState; }
            set
            {
                _selectedIdState = value;
                OnPropertyChanged(nameof(SelectedIdState));
            }
        }


        private AddClientModel _selectedClientState;
        public AddClientModel SelectedClientState
        {
            get { return _selectedClientState; }
            set
            {
                _selectedClientState = value;
                OnPropertyChanged(nameof(SelectedClientState));
            }
        }
        
        public AddClientVM()
        { 

            var idList = AddClientModel.LookUpIdType();
            if (idList != null)
            {
                _idResults.Clear();
                foreach (var idType in idList)
                {
                    _idResults.Add(idType);
                }
            }

            if (_idResults.Any())
            {
                SelectedIdType = _idResults.First();
            }

            var stateList = AddClientModel.LookUpState();
            if (stateList != null)
            {
                _stateResults.Clear();
                foreach (var stateType in stateList)
                {
                    _stateResults.Add(stateType);
                }
            }

            if (_stateResults.Any())
            {
                SelectedClientState = _stateResults.First();
                SelectedIdState = _stateResults.First();
            }

            
            SelectedYear = DateTime.Now.Year;
            SelectedExpYear = DateTime.Now.Year;
            SelectedMonth = "January";
            SelectedIdMonth = "January";
            SelectedDay = 1;

            Months = new ObservableCollection<string>(
                new string[]
                {
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December"
                }
            );
            UpdateDays();
            Days = new ObservableCollection<int>(GenerateDays());
            Years = new ObservableCollection<int>(GenerateYears());
            ExpYears = new ObservableCollection<int>(GenerateExpYears()); 

            OnPropertyChanged(String.Empty);
        }

        private int[] GenerateDays()
        {
            int[] days = new int[31];
            for (int i = 0; i < 31; i++)
            {
                days[i] = i + 1;
            }
            return days;
        }

        private int[] GenerateYears()
        {
            int currentYear = DateTime.Now.Year;
            int[] years = new int[120];
            for (int i = 0; i < 120; i++)
            {
                years[i] = currentYear - i;
            }
            return years;
        }

        private int[] GenerateExpYears()
        {
            int currentYear = DateTime.Now.Year;
            int[] expYears = new int[10];
            for (int i = 0; i < 10; i++)
            {
                expYears[i] = currentYear + i;
            }
            return expYears;
        }
    }
}
