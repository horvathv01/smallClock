using CommunityToolkit.Maui.Views;
using SmallClock.ViewModels;
using SmallClock.Views.Popups;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmallClock.Services
{
    public class PopupWindowService : IPopupWindowService
    {
        public async Task DisplayAlert(string title, string message, string cancel)
        {
            await Application.Current?.MainPage?.DisplayAlert(title, message, "Ok");
        }

        public async Task<bool> DisplayChoice(string title, string message, string affirmative, string negative)
        {
            return await Application.Current.MainPage.DisplayAlert(title, message, affirmative, negative);
        }

        public async Task DisplayInputView(ClockViewModel viewModel)
        {
            var popup = new InputNotificationTimeView(viewModel);
            Application.Current.MainPage.ShowPopup(popup);
        }
    }
}
