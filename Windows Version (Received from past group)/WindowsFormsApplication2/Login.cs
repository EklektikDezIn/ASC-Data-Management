using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication2
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        //login button
        private void button1_Click(object sender, EventArgs e)
        {
            //if no name is entered, prompt for name
            if (textBox1.Text == "")
            {
                MessageBox.Show("Please enter your name.", "Sign In",
           MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            else
            {
                //open main menu, and save username
                this.Hide();
                Manager.MainInstance.workerName = textBox1.Text;
                Manager.MainInstance.ShowDialog();
                textBox1.Text = "";
                this.Show();
            }
        }

        //exit
        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

    }
}
