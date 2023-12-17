using System.Windows;
using System.Windows.Controls;

namespace Wpf.CustomControlLibrary.Controls
{
    public class WebView : UserControl
    {
        #region Constructor

        static WebView()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(WebView),
                new FrameworkPropertyMetadata(typeof(WebView)));
        }

        #endregion
    }
}
