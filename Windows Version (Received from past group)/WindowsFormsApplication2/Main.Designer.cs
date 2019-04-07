namespace WindowsFormsApplication2
{
    partial class Main
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
            this.RoundsButton = new System.Windows.Forms.Button();
            this.CheckoutButton = new System.Windows.Forms.Button();
            this.StatsButton = new System.Windows.Forms.Button();
            this.AdminButton = new System.Windows.Forms.Button();
            this.NameLabel = new System.Windows.Forms.Label();
            this.onDuty = new System.Windows.Forms.Label();
            this.logout = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // RoundsButton
            // 
            this.RoundsButton.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.RoundsButton.Location = new System.Drawing.Point(184, 123);
            this.RoundsButton.Name = "RoundsButton";
            this.RoundsButton.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.RoundsButton.Size = new System.Drawing.Size(100, 50);
            this.RoundsButton.TabIndex = 0;
            this.RoundsButton.Text = "Building Usage";
            this.RoundsButton.UseVisualStyleBackColor = true;
            this.RoundsButton.Click += new System.EventHandler(this.button1_Click);
            // 
            // CheckoutButton
            // 
            this.CheckoutButton.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.CheckoutButton.Location = new System.Drawing.Point(366, 123);
            this.CheckoutButton.Name = "CheckoutButton";
            this.CheckoutButton.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.CheckoutButton.Size = new System.Drawing.Size(100, 50);
            this.CheckoutButton.TabIndex = 1;
            this.CheckoutButton.Text = "Game Checkout";
            this.CheckoutButton.UseVisualStyleBackColor = true;
            this.CheckoutButton.Click += new System.EventHandler(this.button2_Click);
            // 
            // StatsButton
            // 
            this.StatsButton.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.StatsButton.Location = new System.Drawing.Point(184, 237);
            this.StatsButton.Name = "StatsButton";
            this.StatsButton.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.StatsButton.Size = new System.Drawing.Size(100, 50);
            this.StatsButton.TabIndex = 2;
            this.StatsButton.Text = "Statistics";
            this.StatsButton.UseVisualStyleBackColor = true;
            this.StatsButton.Click += new System.EventHandler(this.button3_Click);
            // 
            // AdminButton
            // 
            this.AdminButton.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.AdminButton.Location = new System.Drawing.Point(366, 237);
            this.AdminButton.Name = "AdminButton";
            this.AdminButton.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.AdminButton.Size = new System.Drawing.Size(100, 50);
            this.AdminButton.TabIndex = 3;
            this.AdminButton.Text = "Inventory";
            this.AdminButton.UseVisualStyleBackColor = true;
            this.AdminButton.Click += new System.EventHandler(this.button4_Click);
            // 
            // NameLabel
            // 
            this.NameLabel.BackColor = System.Drawing.Color.White;
            this.NameLabel.Location = new System.Drawing.Point(12, 9);
            this.NameLabel.Name = "NameLabel";
            this.NameLabel.Size = new System.Drawing.Size(120, 19);
            this.NameLabel.TabIndex = 7;
            this.NameLabel.Text = "Student Worker Name";
            this.NameLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // onDuty
            // 
            this.onDuty.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.onDuty.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.onDuty.Location = new System.Drawing.Point(12, 28);
            this.onDuty.Name = "onDuty";
            this.onDuty.Size = new System.Drawing.Size(120, 20);
            this.onDuty.TabIndex = 8;
            this.onDuty.Text = " ";
            // 
            // logout
            // 
            this.logout.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.logout.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.logout.Location = new System.Drawing.Point(15, 357);
            this.logout.Name = "logout";
            this.logout.Size = new System.Drawing.Size(120, 42);
            this.logout.TabIndex = 9;
            this.logout.Text = "Log Out";
            this.logout.UseVisualStyleBackColor = true;
            this.logout.Click += new System.EventHandler(this.button5_Click);
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ClientSize = new System.Drawing.Size(651, 411);
            this.Controls.Add(this.logout);
            this.Controls.Add(this.onDuty);
            this.Controls.Add(this.NameLabel);
            this.Controls.Add(this.AdminButton);
            this.Controls.Add(this.StatsButton);
            this.Controls.Add(this.CheckoutButton);
            this.Controls.Add(this.RoundsButton);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Name = "Main";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Home Screen";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button RoundsButton;
        private System.Windows.Forms.Button CheckoutButton;
        private System.Windows.Forms.Button StatsButton;
        private System.Windows.Forms.Button AdminButton;
        private System.Windows.Forms.Label NameLabel;
        private System.Windows.Forms.Label onDuty;
        private System.Windows.Forms.Button logout;
    }
}
