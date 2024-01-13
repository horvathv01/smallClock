using SmallClock.ViewModels;
using SmallClock.Views.Popups;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmallClock.Services
{
    public interface IPopupWindowService
    {
        Task DisplayAlert(string title, string message, string cancel);

        Task<bool> DisplayChoice(string title, string message, string affirmative, string negative);

        Task DisplayInputView(IValueConverter timeConverter, ClockViewModel viewModel );
    }
}
