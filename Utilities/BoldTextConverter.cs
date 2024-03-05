using System;
using System.Windows;
using System.Globalization;
using System.Windows.Data;

namespace MainClient.Utilities
{
    public class BoldTextConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is int intValue && parameter is string parameterString && int.TryParse(parameterString, out int paramValue))
            {
                return intValue == paramValue ? FontWeights.Bold : FontWeights.Normal;
            }
            return FontWeights.Normal;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}