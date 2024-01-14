using CommunityToolkit.Maui.Views;
using Microsoft.UI;
using SmallClock.Models;
using SmallClock.ViewModels;
using Microsoft.UI.Windowing;
using Windows.Graphics;


namespace SmallClock.Views;

public partial class NotificationTimesListView : ContentView
{
	public NotificationTimesListView()
	{
		InitializeComponent();
	}

    private void ExpanderControl_ExpandedChanged(object sender, CommunityToolkit.Maui.Core.ExpandedChangedEventArgs e)
    {
		if (!ExpanderControl.IsExpanded)
		{
			ExpanderControl.IsExpanded = true;
		}
    }
}