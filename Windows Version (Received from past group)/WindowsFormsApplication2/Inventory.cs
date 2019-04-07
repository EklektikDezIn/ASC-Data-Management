using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication2
{
    public partial class Inventory : Form
    {
        public Inventory()
        {
            InitializeComponent();
        }

        //return to main menu
        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        //load inventory info
        private void Admin_Load(object sender, EventArgs e)
        {
            try
            {
                //get file
                System.IO.FileStream srcFS;
                srcFS = new System.IO.FileStream("asc_inventory.csv", System.IO.FileMode.OpenOrCreate);
                System.IO.StreamReader srcSR = new System.IO.StreamReader(srcFS, System.Text.Encoding.Default);
                string ins = srcSR.ReadLine();
                while (true)
                {
                    //read until end of file
                    ins = srcSR.ReadLine();
                    if (ins == null)
                    {
                        break;
                    }
                    string[] columns = ins.Split(',');

                    //add items to listview
                    ListViewItem lvi = new ListViewItem(columns[0]);

                    for (int i = 0; i < columns.Count(); i++)
                    {
                        lvi.SubItems.Add(columns[i]);
                    }

                    inventoryBox.Items.Add(lvi);

                }
                srcSR.Close();

            }
            catch (Exception errorMsg)
            {
                MessageBox.Show(errorMsg.Message, "Error reading a file", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
