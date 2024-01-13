using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmallClock.Models
{
    public class NotificationTime
    {
        public DateTime Time { get; set; }
        public string Message { get; set; }
        public NotificationTime(DateTime time, string message) 
        {
            Time = time;
            Message = message;
        }

        public override bool Equals(object? obj)
        {
            return obj is NotificationTime other
                && Time.Equals(other.Time)
                && Message.Equals(other.Message);
        }

        public bool TimeMatches(DateTime time)
        {
            return time.Year.Equals(Time.Year)
                && time.Month.Equals(Time.Month)
                && time.Day.Equals(Time.Day)
                && time.Hour.Equals(Time.Hour)
                && time.Minute.Equals(Time.Minute)
                && time.Second.Equals(Time.Second);
        }

        public override int GetHashCode()
        {
            throw new NotImplementedException();
        }
    }
}
