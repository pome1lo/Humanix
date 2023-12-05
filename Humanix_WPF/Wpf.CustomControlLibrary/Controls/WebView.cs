using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows;

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
