using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.Collections;
using CommunityToolkit.Mvvm.ComponentModel;
using SmallClock.Models;

namespace SmallClock.ViewModels
{
    internal partial class ClockViewModel : ObservableObject
    {
#region Properties
        private bool isRunning = false;

        [ObservableProperty]
        public DateTime displayTime;

        [ObservableProperty]
        public ObservableCollection<NotificationTime> notificationTimes;

#endregion

#region Constructor
        public ClockViewModel() 
        {
            notificationTimes = new ObservableCollection<NotificationTime>();
            isRunning = true;
            Run();
        }

#endregion

#region Methods

        public async void Run()
        {
            while (isRunning)
            {
                DisplayTime = DateTime.Now;
                await Task.Delay(1000);
            }
        }

        public async void Alert(NotificationTime time)
        {
            throw new NotImplementedException();
        }

        public void AddNotificationTime(NotificationTime time)
        {
            NotificationTimes.Add(time);
        }

        public void RemoveNotificationTime(NotificationTime time)
        {
            if(NotificationTimes.Contains(time))
            {
                NotificationTimes.Remove(time);
            } else
            {
                throw new InvalidOperationException($"The provided notification time (time: {time.Time}, message: {time.Message}) is not present in the list of notifications.");
            }
        }

        public void ClearNotificationTimes()
        {
            NotificationTimes.Clear();
        }

#endregion
    }
}
