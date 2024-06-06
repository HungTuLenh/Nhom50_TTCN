namespace GUI.NhanVienBep
{
    partial class ucLishSuNhap
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtTongdthu = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tpBd = new System.Windows.Forms.DateTimePicker();
            this.tpKt = new System.Windows.Forms.DateTimePicker();
            this.lvN = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.SuspendLayout();
            // 
            // txtTongdthu
            // 
            this.txtTongdthu.Enabled = false;
            this.txtTongdthu.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTongdthu.Location = new System.Drawing.Point(763, 129);
            this.txtTongdthu.Name = "txtTongdthu";
            this.txtTongdthu.Size = new System.Drawing.Size(159, 22);
            this.txtTongdthu.TabIndex = 49;
            this.txtTongdthu.Text = "0";
            this.txtTongdthu.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(644, 132);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(113, 16);
            this.label3.TabIndex = 48;
            this.label3.Text = "Tổng chi phí nhập";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(720, 87);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(31, 16);
            this.label2.TabIndex = 47;
            this.label2.Text = "Đến";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(695, 43);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(56, 16);
            this.label1.TabIndex = 46;
            this.label1.Text = "Từ ngày";
            // 
            // tpBd
            // 
            this.tpBd.CustomFormat = "dd/MM/yyyy HH:mm";
            this.tpBd.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tpBd.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.tpBd.Location = new System.Drawing.Point(763, 37);
            this.tpBd.Name = "tpBd";
            this.tpBd.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.tpBd.Size = new System.Drawing.Size(159, 22);
            this.tpBd.TabIndex = 45;
            this.tpBd.Value = new System.DateTime(2024, 5, 25, 19, 10, 0, 0);
            this.tpBd.ValueChanged += new System.EventHandler(this.tpBd_ValueChanged);
            // 
            // tpKt
            // 
            this.tpKt.CustomFormat = "dd/MM/yyyy HH:mm";
            this.tpKt.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tpKt.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.tpKt.Location = new System.Drawing.Point(763, 83);
            this.tpKt.Name = "tpKt";
            this.tpKt.Size = new System.Drawing.Size(159, 22);
            this.tpKt.TabIndex = 44;
            this.tpKt.Value = new System.DateTime(2024, 5, 26, 22, 11, 0, 0);
            this.tpKt.ValueChanged += new System.EventHandler(this.tpKt_ValueChanged);
            // 
            // lvN
            // 
            this.lvN.BackColor = System.Drawing.SystemColors.Window;
            this.lvN.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader4});
            this.lvN.ForeColor = System.Drawing.SystemColors.WindowText;
            this.lvN.GridLines = true;
            this.lvN.HideSelection = false;
            this.lvN.Location = new System.Drawing.Point(0, 0);
            this.lvN.Name = "lvN";
            this.lvN.Size = new System.Drawing.Size(634, 537);
            this.lvN.TabIndex = 43;
            this.lvN.UseCompatibleStateImageBehavior = false;
            this.lvN.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Ngày nhập";
            this.columnHeader1.Width = 145;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Nhân viên";
            this.columnHeader2.Width = 174;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Nhà cung cấp";
            this.columnHeader3.Width = 218;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Tổng tiền";
            this.columnHeader4.Width = 88;
            // 
            // ucLishSuNhap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.txtTongdthu);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tpBd);
            this.Controls.Add(this.tpKt);
            this.Controls.Add(this.lvN);
            this.Name = "ucLishSuNhap";
            this.Size = new System.Drawing.Size(982, 537);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtTongdthu;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker tpBd;
        private System.Windows.Forms.DateTimePicker tpKt;
        private System.Windows.Forms.ListView lvN;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader4;
    }
}
