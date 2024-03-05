using MainClient.Utilities;
using System.Windows.Input;
using System.ComponentModel;  

namespace MainClient._ViewModel
{
    class AddNotesVM : INotifyPropertyChanged
    {
        private string _noteContent;
        public string NoteContent
        {
            get { return _noteContent; }
            set 
            { 
                _noteContent = value;
                OnPropertyChanged("NoteContent");
                CharactersRemaining = (1500 - _noteContent.Length).ToString() + " characters remaining";
            }
        }

        public string CharactersRemaining { get; set; }

        public ICommand SaveCommand { get; set; }
        public ICommand CancelCommand { get; set; }

        public AddNotesVM()
        {
            SaveCommand = new RelayCommand(SaveNote);
            CancelCommand = new RelayCommand(CancelNote);
        }

        private void SaveNote(object parameter)
        {
            // Logic to save the note
        }

        private void CancelNote(object parameter)
        {
            // Logic to cancel note addition
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
