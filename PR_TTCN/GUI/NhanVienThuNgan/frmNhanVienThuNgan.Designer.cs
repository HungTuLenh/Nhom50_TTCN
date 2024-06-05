namespace GUI.NhanVienThuNgan
{
    partial class frmNhanVienThuNgan
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblThoat = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.lblLichsutt = new System.Windows.Forms.Label();
            this.lblDangxuat = new System.Windows.Forms.Label();
            this.lblMove = new System.Windows.Forms.Label();
            this.lblThanhtoan = new System.Windows.Forms.Label();
            this.pnTn = new System.Windows.Forms.Panel();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(82)))), ((int)(((byte)(99)))), ((int)(((byte)(81)))));
            this.panel1.Controls.Add(this.lblThoat);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1200, 63);
            this.panel1.TabIndex = 1;
            // 
            // lblThoat
            // 
            this.lblThoat.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThoat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(206)))), ((int)(((byte)(176)))), ((int)(((byte)(126)))));
            this.lblThoat.Image = global::GUI.Properties.Resources.iconizer_circle_xmark;
            this.lblThoat.Location = new System.Drawing.Point(1149, 12);
            this.lblThoat.Name = "lblThoat";
            this.lblThoat.Size = new System.Drawing.Size(25, 25);
            this.lblThoat.TabIndex = 11;
            this.lblThoat.Click += new System.EventHandler(this.lblThoat_Click);
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(186)))), ((int)(((byte)(156)))), ((int)(((byte)(106)))));
            this.label1.Location = new System.Drawing.Point(101, 12);
            this.label1.Name = "label1";
            this.label1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.label1.Size = new System.Drawing.Size(358, 40);
            this.label1.TabIndex = 3;
            this.label1.Text = "Kampong Chicken House";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::GUI.Properties.Resources.logo_1_e1677906278168;
            this.pictureBox1.Location = new System.Drawing.Point(55, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(40, 40);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(42)))), ((int)(((byte)(59)))), ((int)(((byte)(41)))));
            this.panel2.Controls.Add(this.lblLichsutt);
            this.panel2.Controls.Add(this.lblDangxuat);
            this.panel2.Controls.Add(this.lblMove);
            this.panel2.Controls.Add(this.lblThanhtoan);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel2.Location = new System.Drawing.Point(0, 63);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(218, 537);
            this.panel2.TabIndex = 2;
            // 
            // lblLichsutt
            // 
            this.lblLichsutt.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(42)))), ((int)(((byte)(59)))), ((int)(((byte)(41)))));
            this.lblLichsutt.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLichsutt.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.lblLichsutt.Image = global::GUI.Properties.Resources.iconizer_completed;
            this.lblLichsutt.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblLichsutt.Location = new System.Drawing.Point(22, 168);
            this.lblLichsutt.Name = "lblLichsutt";
            this.lblLichsutt.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.lblLichsutt.Size = new System.Drawing.Size(222, 55);
            this.lblLichsutt.TabIndex = 5;
            this.lblLichsutt.Text = "Lịch sử thanh toán";
            this.lblLichsutt.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.lblLichsutt.Click += new System.EventHandler(this.lblLichsutt_Click);
            // 
            // lblDangxuat
            // 
            this.lblDangxuat.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(42)))), ((int)(((byte)(59)))), ((int)(((byte)(41)))));
            this.lblDangxuat.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDangxuat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.lblDangxuat.Image = global::GUI.Properties.Resources.iconizer_sign_out_alt__1_;
            this.lblDangxuat.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblDangxuat.Location = new System.Drawing.Point(22, 473);
            this.lblDangxuat.Name = "lblDangxuat";
            this.lblDangxuat.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.lblDangxuat.Size = new System.Drawing.Size(155, 55);
            this.lblDangxuat.TabIndex = 4;
            this.lblDangxuat.Text = "Đăng xuất";
            this.lblDangxuat.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.lblDangxuat.Click += new System.EventHandler(this.lblDangxuat_Click);
            // 
            // lblMove
            // 
            this.lblMove.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.lblMove.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.lblMove.Location = new System.Drawing.Point(-3, 113);
            this.lblMove.Name = "lblMove";
            this.lblMove.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.lblMove.Size = new System.Drawing.Size(15, 55);
            this.lblMove.TabIndex = 2;
            this.lblMove.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // lblThanhtoan
            // 
            this.lblThanhtoan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(42)))), ((int)(((byte)(59)))), ((int)(((byte)(41)))));
            this.lblThanhtoan.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThanhtoan.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.lblThanhtoan.Image = global::GUI.Properties.Resources.iconizer_file_invoice_dollar__1_;
            this.lblThanhtoan.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblThanhtoan.Location = new System.Drawing.Point(22, 113);
            this.lblThanhtoan.Name = "lblThanhtoan";
            this.lblThanhtoan.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.lblThanhtoan.Size = new System.Drawing.Size(162, 55);
            this.lblThanhtoan.TabIndex = 0;
            this.lblThanhtoan.Text = "Thanh toán";
            this.lblThanhtoan.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.lblThanhtoan.Click += new System.EventHandler(this.lblThanhtoan_Click);
            // 
            // pnTn
            // 
            this.pnTn.BackColor = System.Drawing.SystemColors.ControlDark;
            this.pnTn.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnTn.Location = new System.Drawing.Point(218, 63);
            this.pnTn.Name = "pnTn";
            this.pnTn.Size = new System.Drawing.Size(982, 537);
            this.pnTn.TabIndex = 3;
            // 
            // frmNhanVienThuNgan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1200, 600);
            this.Controls.Add(this.pnTn);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmNhanVienThuNgan";
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.panel2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblThoat;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label lblMove;
        private System.Windows.Forms.Label lblThanhtoan;
        private System.Windows.Forms.Panel pnTn;
        private System.Windows.Forms.Label lblDangxuat;
        private System.Windows.Forms.Label lblLichsutt;
    }
}