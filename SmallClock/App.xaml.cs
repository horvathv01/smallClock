﻿#if WINDOWS
using Microsoft.UI;
using Microsoft.UI.Windowing;
using Windows.Graphics;
#endif


namespace SmallClock
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

#if WINDOWS
            Microsoft.Maui.Handlers.WindowHandler.Mapper.AppendToMapping(nameof(IWindow), (handler, view) =>
            {
                const int WindowWidth = 350;
                const int WindowHeight = 150;

                var mauiWindow = handler.VirtualView;
                var nativeWindow = handler.PlatformView;
                nativeWindow.Activate();
                IntPtr windowHandle = WinRT.Interop.WindowNative.GetWindowHandle(nativeWindow);
                WindowId windowId = Microsoft.UI.Win32Interop.GetWindowIdFromWindow(windowHandle);
                AppWindow appWindow = Microsoft.UI.Windowing.AppWindow.GetFromWindowId(windowId);
                appWindow.Resize(new SizeInt32(WindowWidth, WindowHeight));
        });
#endif
            MainPage = new AppShell();
        }
    }
}





