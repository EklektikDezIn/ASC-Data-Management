namespace WindowsFormsApplication2
{
    partial class Checkout
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.NameBox = new System.Windows.Forms.TextBox();
            this.IDBox = new System.Windows.Forms.TextBox();
            this.NameLabel = new System.Windows.Forms.Label();
            this.IDLabel = new System.Windows.Forms.Label();
            this.SubmitButton = new System.Windows.Forms.Button();
            this.XBoxRadio = new System.Windows.Forms.RadioButton();
            this.WiiRadio = new System.Windows.Forms.RadioButton();
            this.PSRadio = new System.Windows.Forms.RadioButton();
            this.PhysicalRadio = new System.Windows.Forms.RadioButton();
            this.ControllersNum = new System.Windows.Forms.NumericUpDown();
            this.ControllersLabel = new System.Windows.Forms.Label();
            this.BackButton = new System.Windows.Forms.Button();
            this.returnButton = new System.Windows.Forms.Button();
            this.console = new System.Windows.Forms.GroupBox();
            this.hdmi = new System.Windows.Forms.CheckBox();
            this.listView1 = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader6 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader7 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chargers = new System.Windows.Forms.CheckBox();
            this.gamescheck = new System.Windows.Forms.FlowLayoutPanel();
            ((System.ComponentModel.ISupportInitialize)(this.ControllersNum)).BeginInit();
            this.console.SuspendLayout();
            this.SuspendLayout();
            // 
            // NameBox
            // 
            this.NameBox.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.NameBox.Location = new System.Drawing.Point(342, 65);
            this.NameBox.Name = "NameBox";
            this.NameBox.Size = new System.Drawing.Size(117, 20);
            this.NameBox.TabIndex = 20;
            // 
            // IDBox
            // 
            this.IDBox.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.IDBox.Location = new System.Drawing.Point(342, 94);
            this.IDBox.Name = "IDBox";
            this.IDBox.Size = new System.Drawing.Size(117, 20);
            this.IDBox.TabIndex = 21;
            // 
            // NameLabel
            // 
            this.NameLabel.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.NameLabel.AutoSize = true;
            this.NameLabel.Location = new System.Drawing.Point(261, 68);
            this.NameLabel.Name = "NameLabel";
            this.NameLabel.Size = new System.Drawing.Size(75, 13);
            this.NameLabel.TabIndex = 22;
            this.NameLabel.Text = "Student Name";
            // 
            // IDLabel
            // 
            this.IDLabel.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.IDLabel.AutoSize = true;
            this.IDLabel.Location = new System.Drawing.Point(278, 97);
            this.IDLabel.Name = "IDLabel";
            this.IDLabel.Size = new System.Drawing.Size(58, 13);
            this.IDLabel.TabIndex = 23;
            this.IDLabel.Text = "ID Number";
            // 
            // SubmitButton
            // 
            this.SubmitButton.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.SubmitButton.Location = new System.Drawing.Point(384, 136);
            this.SubmitButton.Name = "SubmitButton";
            this.SubmitButton.Size = new System.Drawing.Size(75, 32);
            this.SubmitButton.TabIndex = 24;
            this.SubmitButton.Text = "Submit";
            this.SubmitButton.UseVisualStyleBackColor = true;
            this.SubmitButton.Click += new System.EventHandler(this.button1_Click);
            // 
            // XBoxRadio
            // 
            this.XBoxRadio.AutoSize = true;
            this.XBoxRadio.Location = new System.Drawing.Point(9, 19);
            this.XBoxRadio.Name = "XBoxRadio";
            this.XBoxRadio.Size = new System.Drawing.Size(48, 17);
            this.XBoxRadio.TabIndex = 25;
            this.XBoxRadio.Text = "xBox";
            this.XBoxRadio.UseVisualStyleBackColor = true;
            this.XBoxRadio.CheckedChanged += new System.EventHandler(this.XBoxRadio_CheckedChanged);
            // 
            // WiiRadio
            // 
            this.WiiRadio.AutoSize = true;
            this.WiiRadio.Location = new System.Drawing.Point(9, 42);
            this.WiiRadio.Name = "WiiRadio";
            this.WiiRadio.Size = new System.Drawing.Size(40, 17);
            this.WiiRadio.TabIndex = 26;
            this.WiiRadio.Text = "Wii";
            this.WiiRadio.UseVisualStyleBackColor = true;
            this.WiiRadio.CheckedChanged += new System.EventHandler(this.WiiRadio_CheckedChanged);
            // 
            // PSRadio
            // 
            this.PSRadio.AutoSize = true;
            this.PSRadio.Location = new System.Drawing.Point(9, 65);
            this.PSRadio.Name = "PSRadio";
            this.PSRadio.Size = new System.Drawing.Size(76, 17);
            this.PSRadio.TabIndex = 27;
            this.PSRadio.Text = "Playstation";
            this.PSRadio.UseVisualStyleBackColor = true;
            this.PSRadio.CheckedChanged += new System.EventHandler(this.PSRadio_CheckedChanged);
            // 
            // PhysicalRadio
            // 
            this.PhysicalRadio.AutoSize = true;
            this.PhysicalRadio.Location = new System.Drawing.Point(9, 88);
            this.PhysicalRadio.Name = "PhysicalRadio";
            this.PhysicalRadio.Size = new System.Drawing.Size(64, 17);
            this.PhysicalRadio.TabIndex = 29;
            this.PhysicalRadio.Text = "Physical";
            this.PhysicalRadio.UseVisualStyleBackColor = true;
            this.PhysicalRadio.CheckedChanged += new System.EventHandler(this.PhysicalRadio_CheckedChanged);
            // 
            // ControllersNum
            // 
            this.ControllersNum.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.ControllersNum.Location = new System.Drawing.Point(262, 146);
            this.ControllersNum.Name = "ControllersNum";
            this.ControllersNum.Size = new System.Drawing.Size(54, 20);
            this.ControllersNum.TabIndex = 28;
            // 
            // ControllersLabel
            // 
            this.ControllersLabel.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.ControllersLabel.AutoSize = true;
            this.ControllersLabel.Location = new System.Drawing.Point(261, 127);
            this.ControllersLabel.Name = "ControllersLabel";
            this.ControllersLabel.Size = new System.Drawing.Size(56, 13);
            this.ControllersLabel.TabIndex = 29;
            this.ControllersLabel.Text = "Controllers";
            this.ControllersLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // BackButton
            // 
            this.BackButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.BackButton.Location = new System.Drawing.Point(22, 333);
            this.BackButton.Name = "BackButton";
            this.BackButton.Size = new System.Drawing.Size(80, 42);
            this.BackButton.TabIndex = 32;
            this.BackButton.Text = "Back";
            this.BackButton.UseVisualStyleBackColor = true;
            this.BackButton.Click += new System.EventHandler(this.BackButton_Click);
            // 
            // returnButton
            // 
            this.returnButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.returnButton.Location = new System.Drawing.Point(404, 333);
            this.returnButton.Name = "returnButton";
            this.returnButton.Size = new System.Drawing.Size(80, 42);
            this.returnButton.TabIndex = 33;
            this.returnButton.Text = "Return Item";
            this.returnButton.UseVisualStyleBackColor = true;
            this.returnButton.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // console
            // 
            this.console.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.console.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.console.Controls.Add(this.PhysicalRadio);
            this.console.Controls.Add(this.XBoxRadio);
            this.console.Controls.Add(this.WiiRadio);
            this.console.Controls.Add(this.PSRadio);
            this.console.Location = new System.Drawing.Point(15, 16);
            this.console.Name = "console";
            this.console.Size = new System.Drawing.Size(92, 111);
            this.console.TabIndex = 40;
            this.console.TabStop = false;
            this.console.Text = "Console";
            // 
            // hdmi
            // 
            this.hdmi.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.hdmi.AutoSize = true;
            this.hdmi.Location = new System.Drawing.Point(264, 35);
            this.hdmi.Name = "hdmi";
            this.hdmi.Size = new System.Drawing.Size(126, 17);
            this.hdmi.TabIndex = 44;
            this.hdmi.Text = "HDMI Cable/Adapter";
            this.hdmi.UseVisualStyleBackColor = true;
            // 
            // listView1
            // 
            this.listView1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.listView1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader4,
            this.columnHeader3,
            this.columnHeader5,
            this.columnHeader6,
            this.columnHeader7});
            this.listView1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.5F);
            this.listView1.FullRowSelect = true;
            this.listView1.Location = new System.Drawing.Point(15, 190);
            this.listView1.Name = "listView1";
            this.listView1.Size = new System.Drawing.Size(483, 112);
            this.listView1.TabIndex = 45;
            this.listView1.UseCompatibleStateImageBehavior = false;
            this.listView1.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Student Name";
            this.columnHeader1.Width = 79;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Student ID";
            this.columnHeader2.Width = 63;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Game";
            this.columnHeader4.Width = 91;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Controllers";
            this.columnHeader3.Width = 61;
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "HDMI";
            this.columnHeader5.Width = 40;
            // 
            // columnHeader6
            // 
            this.columnHeader6.Text = "Chargers";
            this.columnHeader6.Width = 55;
            // 
            // columnHeader7
            // 
            this.columnHeader7.Text = "Worker Name";
            this.columnHeader7.Width = 90;
            // 
            // chargers
            // 
            this.chargers.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.chargers.AutoSize = true;
            this.chargers.Location = new System.Drawing.Point(264, 16);
            this.chargers.Name = "chargers";
            this.chargers.Size = new System.Drawing.Size(97, 17);
            this.chargers.TabIndex = 46;
            this.chargers.Text = "Phone Charger";
            this.chargers.UseVisualStyleBackColor = true;
            // 
            // gamescheck
            // 
            this.gamescheck.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.gamescheck.AutoScroll = true;
            this.gamescheck.BackColor = System.Drawing.SystemColors.Control;
            this.gamescheck.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.gamescheck.Location = new System.Drawing.Point(117, 14);
            this.gamescheck.Name = "gamescheck";
            this.gamescheck.Size = new System.Drawing.Size(138, 170);
            this.gamescheck.TabIndex = 47;
            // 
            // Checkout
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(513, 391);
            this.Controls.Add(this.gamescheck);
            this.Controls.Add(this.chargers);
            this.Controls.Add(this.listView1);
            this.Controls.Add(this.hdmi);
            this.Controls.Add(this.console);
            this.Controls.Add(this.returnButton);
            this.Controls.Add(this.BackButton);
            this.Controls.Add(this.ControllersLabel);
            this.Controls.Add(this.ControllersNum);
            this.Controls.Add(this.SubmitButton);
            this.Controls.Add(this.IDLabel);
            this.Controls.Add(this.NameLabel);
            this.Controls.Add(this.IDBox);
            this.Controls.Add(this.NameBox);
            this.Name = "Checkout";
            this.Text = "Checkout";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Checkout_Load);
            ((System.ComponentModel.ISupportInitialize)(this.ControllersNum)).EndInit();
            this.console.ResumeLayout(false);
            this.console.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.TextBox NameBox;
        private System.Windows.Forms.TextBox IDBox;
        private System.Windows.Forms.Label NameLabel;
        private System.Windows.Forms.Label IDLabel;
        private System.Windows.Forms.Button SubmitButton;
        private System.Windows.Forms.RadioButton XBoxRadio;
        private System.Windows.Forms.RadioButton WiiRadio;
        private System.Windows.Forms.RadioButton PSRadio;
        private System.Windows.Forms.RadioButton PhysicalRadio;
        private System.Windows.Forms.NumericUpDown ControllersNum;
        private System.Windows.Forms.Label ControllersLabel;
        private System.Windows.Forms.Button BackButton;
        private System.Windows.Forms.Button returnButton;
        private System.Windows.Forms.GroupBox console;
        private System.Windows.Forms.CheckBox hdmi;
        private System.Windows.Forms.ListView listView1;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private System.Windows.Forms.ColumnHeader columnHeader7;
        private System.Windows.Forms.CheckBox chargers;
        private System.Windows.Forms.ColumnHeader columnHeader6;
        private System.Windows.Forms.FlowLayoutPanel gamescheck;
    }
}
