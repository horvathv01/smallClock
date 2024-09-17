using CommunityToolkit.Maui.Views;
using SmallClock.ViewModels;
using SmallClock.Views.Popups;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
#if WINDOWS
using Microsoft.UI.Xaml;
#endif


namespace SmallClock.Services
{
    public class PopupWindowService : IPopupWindowService
    {
        public async Task DisplayAlert(string title, string message, string cancel)
        {

#if WINDOWS
            //Microsoft.UI.Xaml.Window window = (Microsoft.UI.Xaml.Window)App.Current.Windows.First<Window>().Handler.PlatformView;
            Microsoft.UI.Xaml.Window window = (Microsoft.UI.Xaml.Window)App.Current.Windows.First().Handler.PlatformView;
            IntPtr windowHandle = WinRT.Interop.WindowNative.GetWindowHandle(window);
            Microsoft.UI.WindowId windowId = Microsoft.UI.Win32Interop.GetWindowIdFromWindow(windowHandle);
            Microsoft.UI.Windowing.AppWindow appWindow = Microsoft.UI.Windowing.AppWindow.GetFromWindowId(windowId);
            (appWindow.Presenter as Microsoft.UI.Windowing.OverlappedPresenter).IsAlwaysOnTop = true;
            (appWindow.Presenter as Microsoft.UI.Windowing.OverlappedPresenter).IsAlwaysOnTop = false;
#endif
            await Microsoft.Maui.Controls.Application.Current.MainPage.DisplayAlert( title, message, "Ok" );
        }

        public async Task<bool> DisplayChoice(string title, string message, string affirmative, string negative)
        {
            return await Microsoft.Maui.Controls.Application.Current.MainPage.DisplayAlert(title, message, affirmative, negative);
        }

        public async Task DisplayInputView(IValueConverter timeConverter, ClockViewModel viewModel)
        {
            var popup = new InputNotificationTimeView(timeConverter, viewModel);
            Microsoft.Maui.Controls.Application.Current.MainPage.ShowPopup(popup);
        }
    }
}
