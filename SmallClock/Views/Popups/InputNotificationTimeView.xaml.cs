using CommunityToolkit.Maui.Views;
using SmallClock.ViewModels;

namespace SmallClock.Views.Popups;

public partial class InputNotificationTimeView : Popup
{
	public InputNotificationTimeView(ClockViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}