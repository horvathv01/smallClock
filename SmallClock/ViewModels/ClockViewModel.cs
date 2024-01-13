using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Maui.Core;
using CommunityToolkit.Maui.Core.Extensions;
using CommunityToolkit.Maui.Views;
using CommunityToolkit.Mvvm.Collections;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using SmallClock.Models;
using SmallClock.Services;

namespace SmallClock.ViewModels
{
    public partial class ClockViewModel : ObservableObject
    {
#region Properties
        private bool isRunning = false;

        [ObservableProperty]
        public DateTime displayTime;

        [ObservableProperty]
        public ObservableCollection<NotificationTime> notificationTimes;

        private IValueConverter _timeConverter;
        private IPopupWindowService _popupService;



#endregion

#region Constructor
        public ClockViewModel(IValueConverter timeConverter, IPopupWindowService popupService) 
        {
            NotificationTimes = new ObservableCollection<NotificationTime>();
            isRunning = true;
            _timeConverter = timeConverter;
            _popupService = popupService;
            Run();
            //Prepopulate();
        }

#endregion

#region Methods

        public async void Run()
        {
            while (isRunning)
            {
                DisplayTime = DateTime.Now;
                await Task.Delay(1000);
                CheckForDueNotification();
            }
        }

        private void CheckForDueNotification()
        {
            NotificationTime? toDelete = null;
            foreach (var notification in NotificationTimes)
            {
                if(notification.TimeMatches(DisplayTime))
                {
                    Alert(notification);
                    toDelete = notification;
                    break;
                }
            }

            if(toDelete != null)
            {
                RemoveNotificationTime(toDelete);
            }
            
        }

        public void Alert(object obj)
        {
            if(obj is NotificationTime time)
            {
            string convertedTime = _timeConverter.Convert(time.Time, typeof(string), "HH\\:mm", CultureInfo.CurrentCulture).ToString();
            _popupService.DisplayAlert(convertedTime, time.Message, "OK");
            } 
            else if (obj is string message)
            {
                _popupService.DisplayAlert("Alert!", message, "OK");
            }
        }

        [RelayCommand]
        public void OpenPopup(object element)
        {
            if(element is Button button && button.StyleId == "AddNotificationButton")
            {
                _popupService.DisplayInputView(_timeConverter, this);
            }
        }

        public async void AddNotificationTime(NotificationTime time)
        {
            //check for same time: not allowed    
            foreach (var notification in NotificationTimes)
            {
                if(time.TimeMatches(notification.Time))
                {
                    var convertedTime = _timeConverter.Convert(notification.Time, typeof(string), "HH\\:mm", CultureInfo.CurrentCulture);
                    Alert($"Notification for {convertedTime} already exists.");
                    return;
                }
            }
            var now = DateTime.Now;
            if(time.Time < now)
            {
                var choice = await _popupService.DisplayChoice("Warning!", "The time of this notification is in the past. Are you sure?", "Yes", "Cancel");
                if(!choice) { return; }
            }

            NotificationTimes.Add(time);
            NotificationTimes = NotificationTimes.Select(time => time)
                                                  .OrderBy(time => time.Time)
                                                  .ToObservableCollection();
        }

        [RelayCommand]
        public void RemoveNotificationTime(object element)
        {
            if(element is NotificationTime time && NotificationTimes.Contains(time))
            {
                NotificationTimes.Remove(time);
            } 
            else
            {
                throw new InvalidOperationException($"The provided notification time is not present in the list of notifications.");
            }
        }
        
        [RelayCommand]
        public void ClearNotificationTimes()
        {
            NotificationTimes.Clear();
        }

        private void Prepopulate()
        {
            for(int i = 0; i < 5; i++)
            {
                var time = new DateTime(2024, 01, 12, 10, i, 0);
                var notification = new NotificationTime(time, $"Notification number {i}.");
                AddNotificationTime(notification);
            }

            var newTime = new DateTime(2024, 01, 12, 11, 26, 0);
            var newNotification = new NotificationTime(newTime, "ALERT!");
            AddNotificationTime(newNotification);

            var invalidTime = new DateTime(2024, 01, 12, 11, 26, 0);
            var invalidNotification = new NotificationTime(invalidTime, "Invalid one");
            AddNotificationTime(invalidNotification);
        }

#endregion
    }
}
