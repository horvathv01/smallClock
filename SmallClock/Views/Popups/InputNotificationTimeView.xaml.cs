using CommunityToolkit.Maui.Views;
using SmallClock.ViewModels;
using System.Globalization;
using SmallClock.Models;

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

    private void CloseButtonClicked(object sender, EventArgs e)
    {
        Close();
    }

    private void SaveButtonClicked(object sender, EventArgs e)
    {
        if (TimePickerControl.Time.Hours == 0 && TimePickerControl.Time.Minutes == 0 && MessageControl.Text == null)
        {
            return;
        }
        if(BindingContext is ClockViewModel vm)
        {
            var time = (DateTime?)_timeConverter.ConvertBack(TimePickerControl.Time, typeof(DateTime), "HH\\:mm", CultureInfo.CurrentCulture);
            if (!time.HasValue)
            {
                throw new InvalidOperationException("Timespan conversion failed");
            }
            var message = MessageControl.Text == null ? "" : MessageControl.Text;
            var notificationTime = new NotificationTime(time.Value, message);
            vm.AddNotificationTime(notificationTime);
            Close();
        }
        else
        {
            throw new Exception("BindingContext of InputNotificationTimeView was changed from ClockViewModel to something else.");
        }
    }
}