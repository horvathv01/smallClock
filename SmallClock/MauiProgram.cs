using Microsoft.Extensions.Logging;
using SmallClock.Converters;
using SmallClock.ViewModels;
using SmallClock.Views;

namespace SmallClock
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            builder.Services.AddScoped<TimeConverter>();
            
            builder.Services.AddSingleton<NotificationTimesListView>();
            builder.Services.AddSingleton<ClockViewModel>();
            builder.Services.AddSingleton<MainPage>();
#if DEBUG
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
