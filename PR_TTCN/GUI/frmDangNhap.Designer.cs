namespace GUI
{
    partial class frmDangNhap
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDangNhap));
            this.txtManv = new System.Windows.Forms.TextBox();
            this.txtMatkhau = new System.Windows.Forms.TextBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.lblThoat = new System.Windows.Forms.Label();
            this.chbHienthi = new System.Windows.Forms.CheckBox();
            this.lblDangNhap = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtManv
            // 
            this.txtManv.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(62)))), ((int)(((byte)(79)))), ((int)(((byte)(61)))));
            this.txtManv.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtManv.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtManv.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.txtManv.HideSelection = false;
            this.txtManv.Location = new System.Drawing.Point(195, 222);
            this.txtManv.Name = "txtManv";
            this.txtManv.Size = new System.Drawing.Size(391, 19);
            this.txtManv.TabIndex = 0;
            this.txtManv.Text = "nv01";
            // 
            // txtMatkhau
            // 
            this.txtMatkhau.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(62)))), ((int)(((byte)(79)))), ((int)(((byte)(61)))));
            this.txtMatkhau.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtMatkhau.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMatkhau.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.txtMatkhau.Location = new System.Drawing.Point(195, 281);
            this.txtMatkhau.Name = "txtMatkhau";
            this.txtMatkhau.PasswordChar = '*';
            this.txtMatkhau.Size = new System.Drawing.Size(391, 19);
            this.txtMatkhau.TabIndex = 1;
            this.txtMatkhau.Text = "1111";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(345, 39);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 108);
            this.pictureBox1.TabIndex = 4;
            this.pictureBox1.TabStop = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.label1.Location = new System.Drawing.Point(278, 159);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(246, 29);
            this.label1.TabIndex = 5;
            this.label1.Text = "Đăng nhập hệ thống";
            // 
            // label3
            // 
            this.label3.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.label3.Location = new System.Drawing.Point(195, 245);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(391, 3);
            this.label3.TabIndex = 7;
            // 
            // label5
            // 
            this.label5.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.label5.Location = new System.Drawing.Point(195, 303);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(391, 3);
            this.label5.TabIndex = 9;
            // 
            // lblThoat
            // 
            this.lblThoat.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThoat.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(206)))), ((int)(((byte)(176)))), ((int)(((byte)(126)))));
            this.lblThoat.Image = ((System.Drawing.Image)(resources.GetObject("lblThoat.Image")));
            this.lblThoat.Location = new System.Drawing.Point(763, 9);
            this.lblThoat.Name = "lblThoat";
            this.lblThoat.Size = new System.Drawing.Size(25, 25);
            this.lblThoat.TabIndex = 10;
            this.lblThoat.Click += new System.EventHandler(this.lblThoat_Click);
            // 
            // chbHienthi
            // 
            this.chbHienthi.AutoSize = true;
            this.chbHienthi.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chbHienthi.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.chbHienthi.Location = new System.Drawing.Point(454, 309);
            this.chbHienthi.Name = "chbHienthi";
            this.chbHienthi.Size = new System.Drawing.Size(141, 22);
            this.chbHienthi.TabIndex = 11;
            this.chbHienthi.Text = "Hiển thị mật khẩu";
            this.chbHienthi.UseVisualStyleBackColor = true;
            this.chbHienthi.CheckedChanged += new System.EventHandler(this.chbHienthi_CheckedChanged);
            // 
            // lblDangNhap
            // 
            this.lblDangNhap.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(196)))), ((int)(((byte)(166)))), ((int)(((byte)(116)))));
            this.lblDangNhap.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDangNhap.ForeColor = System.Drawing.Color.Black;
            this.lblDangNhap.Location = new System.Drawing.Point(318, 369);
            this.lblDangNhap.Name = "lblDangNhap";
            this.lblDangNhap.Size = new System.Drawing.Size(158, 37);
            this.lblDangNhap.TabIndex = 12;
            this.lblDangNhap.Text = "Đăng nhập";
            this.lblDangNhap.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.lblDangNhap.Click += new System.EventHandler(this.lblDangNhap_Click);
            // 
            // frmDangNhap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(62)))), ((int)(((byte)(79)))), ((int)(((byte)(61)))));
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.lblDangNhap);
            this.Controls.Add(this.chbHienthi);
            this.Controls.Add(this.lblThoat);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.txtMatkhau);
            this.Controls.Add(this.txtManv);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmDangNhap";
            this.Text = "Kampong Chicken House";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtManv;
        private System.Windows.Forms.TextBox txtMatkhau;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label1;
        protected System.Windows.Forms.Label label3;
        protected System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label lblThoat;
        private System.Windows.Forms.CheckBox chbHienthi;
        private System.Windows.Forms.Label lblDangNhap;
    }
}