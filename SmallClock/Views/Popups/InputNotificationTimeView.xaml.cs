using CommunityToolkit.Maui.Views;
using SmallClock.ViewModels;

namespace SmallClock.Views.Popups;

public partial class InputNotificationTimeView : Popup
{
	private IValueConverter _timeConverter;

    public InputNotificationTimeView(IValueConverter timeConverter, ClockViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
		_timeConverter = timeConverter;
        Size = new Size(DeviceDisplay.Current.MainDisplayInfo.Width, DeviceDisplay.Current.MainDisplayInfo.Height);
    }

    private void TimeChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
    {
		//get value, use converter to convert it back to DateTime, then call BindingContext's AddNotificationTime method with it

    }

    private void CloseButtonClicked(object sender, EventArgs e)
    {
        Close();
    }

    private void NotificationMessageChanged(object sender, TextChangedEventArgs e)
    {

    }

    private void SaveButtonClicked(object sender, EventArgs e)
    {

    }
}