using System;
using System.Globalization;
using System.Windows.Data;

namespace MainClient.Utilities
{
    public class CurrencyFormatConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            // If the incoming value is null, return an empty string.
            // Otherwise, return a dollar sign.
            return value == null ? string.Empty : "$";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}