using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;

namespace WindowsFormsApplication2
{
    public partial class Statistics : Form
    {
        public Statistics()
        {
            InitializeComponent();
        }

        //return to main
        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        // This function computes the average and finds the max and min
        static double ColumnStats(IEnumerable<string> strs, int column, string mode)  
        {  
 
            //split lines, convert to ints, and add to list.  
            var columnQuery =  
                from line in strs  
                let elements = line.Split(',')  
                select Convert.ToInt32(elements[column]);  
   
            var results = columnQuery.ToList();

            //take average or sum of items
            if (mode == "average")
                return Math.Round(results.Average(),2);
            else if (mode == "sum")
                return results.Sum();
            else
                return 0;
 
        } 

        //load stats
        private void Statistics_Load(object sender, EventArgs e)
        {
            string[] lines = System.IO.File.ReadAllLines(@"asc_data.csv");

            //Compute Averages  
            CommonGroundsNum.Text = ColumnStats(lines, 2, "average").ToString();
            CommuterLoungeNum.Text = ColumnStats(lines, 3, "average").ToString();
            MediaRoomNum.Text = ColumnStats(lines, 4, "average").ToString();
            HiveNum.Text = ColumnStats(lines, 5, "average").ToString();
            BreakoutNum.Text = ColumnStats(lines, 6, "average").ToString();
            GreatRoomNum.Text = ColumnStats(lines, 7, "average").ToString();
            MailNum.Text = ColumnStats(lines, 8, "average").ToString();
            Halls1Num.Text = ColumnStats(lines, 9, "average").ToString();
            Other1Num.Text = ColumnStats(lines, 10, "average").ToString();
            CollabNum.Text = ColumnStats(lines, 12, "average").ToString();
            PrayerNum.Text = ColumnStats(lines, 13, "average").ToString();
            ActivitiesNum.Text = ColumnStats(lines, 14, "average").ToString();
            GameRoomNum.Text = ColumnStats(lines, 15, "average").ToString();
            Halls2Num.Text = ColumnStats(lines, 16, "average").ToString();
            Other2Num.Text = ColumnStats(lines, 17, "average").ToString();

            //calculate the total average
            totalAverage.Text = Math.Round(((
                ColumnStats(lines, 2, "sum") + ColumnStats(lines, 3, "sum") +
                ColumnStats(lines, 4, "sum") + ColumnStats(lines, 5, "sum") +
                ColumnStats(lines, 6, "sum") + ColumnStats(lines, 7, "sum") +
                ColumnStats(lines, 8, "sum") + ColumnStats(lines, 9, "sum") +
                ColumnStats(lines, 10, "sum") + ColumnStats(lines, 11, "sum") +
                ColumnStats(lines, 12, "sum") + ColumnStats(lines, 13, "sum") +
                ColumnStats(lines, 14, "sum") + ColumnStats(lines, 15, "sum") +
                ColumnStats(lines, 16, "sum") + ColumnStats(lines, 17, "sum")
                )/(lines.Count())),2).ToString();
        }
    }
}