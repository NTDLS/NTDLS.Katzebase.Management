namespace NTDLS.Katzebase.Management.Controls
{
    internal class DoubleBufferedListReport : ListView
    {
        public DoubleBufferedListReport()
        {
            DoubleBuffered = true;
            SetStyle(ControlStyles.OptimizedDoubleBuffer | ControlStyles.AllPaintingInWmPaint, true);
            UpdateStyles();
            GridLines = true;
            FullRowSelect = true;
            View = View.Details;
        }
    }
}
