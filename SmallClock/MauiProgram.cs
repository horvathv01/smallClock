using CommunityToolkit.Maui;
using CommunityToolkit.Maui.Core;
using Microsoft.Extensions.Logging;
using SmallClock.Converters;
using SmallClock.Services;
using SmallClock.ViewModels;
using SmallClock.Views;
using SmallClock.Views.Popups;

namespace SmallClock
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            builder.Services.AddSingleton<IValueConverter, TimeConverter>();
            builder.Services.AddScoped<IPopupWindowService, PopupWindowService>();

            builder.Services.AddSingleton<NotificationTimesListView>();
            builder.Services.AddSingleton<ClockViewModel>();
            builder.Services.AddSingleton<MainPage>();
            builder.Services.AddScoped<InputNotificationTimeView>();
            
#if DEBUG
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
