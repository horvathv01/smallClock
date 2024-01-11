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

        public override int GetHashCode()
        {
            throw new NotImplementedException();
        }
    }
}
