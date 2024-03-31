using System;

namespace MainClient.Services
{
    public class RepIdService
    {
        private static readonly RepIdService _instance = new RepIdService();
        public static RepIdService Instance => _instance;
        
        // private string _selectedRepIdNumber = string.Empty;

        // Adding properties for permissions
        public string RepId { get; private set; }
        public bool Trading { get; private set; }
        public bool MoveMoney { get; private set; }
        public bool ViewOnly { get; private set; }

        // Private constructor ensures the class cannot be instantiated from outside
        private RepIdService() { }

        // public event Action SelectedRepIdNumberChanged;

        // public string SelectedRepIdNumber
        // {
        //     get => _selectedRepIdNumber;
        //     set
        //     {
        //         if (_selectedRepIdNumber != value)
        //         {
        //             _selectedRepIdNumber = value;
        //             OnSelectedRepIdNumberChanged();
        //         }
        //     }
        // }

        // protected virtual void OnSelectedRepIdNumberChanged()
        // {
        //     SelectedRepIdNumberChanged?.Invoke();
        // }

        // Method to set permissions
        public void SetPermissions(string repId, bool trading, bool moveMoney, bool viewOnly)
        {
            RepId = repId;
            Trading = trading;
            MoveMoney = moveMoney;
            ViewOnly = viewOnly;
        }
    }
}