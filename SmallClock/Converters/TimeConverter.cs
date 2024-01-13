using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmallClock.Converters
{
    internal class TimeConverter : IValueConverter
    {
        public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
        {
            if(value is DateTime time && parameter is string paramString)
            {
                return time.ToString(paramString);
            } else
            {
                throw new NotImplementedException();
            }
        }

        public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
        {
            if(value is TimeSpan time && targetType == typeof(DateTime))
            {
                var now = DateTime.Now;
                return new DateTime(
                    now.Year, 
                    now.Month, 
                    time.Hours == 0 && time.Minutes == 0 ? now.Day + 1 : now.Day, //sets notification for next day
                    time.Hours, 
                    time.Minutes, 
                    0);
            } else
            {
                throw new NotImplementedException();
            }
        }
    }
}
