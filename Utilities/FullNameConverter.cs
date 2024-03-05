using System;
using System.Globalization;
using System.Windows.Data;

namespace MainClient.Utilities
{
    public class FullNameConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            string firstName = values[0] as string;
            string middleName = values[1] as string;
            string lastName = values[2] as string;
            string suffix = values[3] as string;

            string fullName = $"{firstName} {(string.IsNullOrEmpty(middleName) ? "" : middleName + " ")}{lastName} {(string.IsNullOrEmpty(suffix) ? "" : suffix)}";
            return fullName.Trim();
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            throw new NotSupportedException();
        }
    }
}