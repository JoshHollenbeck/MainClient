﻿using System.Windows.Controls;
using MainClient._ViewModel;

namespace MainClient._View
{
    /// <summary>
    /// Interaction logic for Settings.xaml
    /// </summary>
    public partial class Positions : UserControl
    {
        public Positions()
        {
            InitializeComponent();
            DataContext = new PositionsVM();
        }
    }
}
