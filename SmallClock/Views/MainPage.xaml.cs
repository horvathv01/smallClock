using SmallClock.ViewModels;

namespace SmallClock.Views;

public partial class MainPage : ContentPage
{
	public MainPage(ClockViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}