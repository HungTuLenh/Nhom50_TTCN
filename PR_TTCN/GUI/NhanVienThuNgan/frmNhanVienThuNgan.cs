using GUI.NhanVienPhucVu;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.NhanVienThuNgan
{
    public partial class frmNhanVienThuNgan : Form
    {
        public frmNhanVienThuNgan()
        {
            InitializeComponent();
            LabelMove(lblThanhtoan);
            LabelMove(lblLichsutt);
        }

        private void LabelMove(Control c)
        {
            lblMove.Height = c.Height;
            lblMove.Top = c.Top;
        }

        private void lblThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }

        private void lblDangxuat_Click(object sender, EventArgs e)
        {
            this.Hide();
            this.FormClosed += FrmNhanVienThuNgan_FormClosed;
            frmDangNhap dn = new frmDangNhap();
            dn.Show();
        }
        private void FrmNhanVienThuNgan_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void lblThanhtoan_Click(object sender, EventArgs e)
        {
            LabelMove(lblThanhtoan);
            if (!pnTn.Controls.Contains(ucThanhToan.Instance))
            {
                pnTn.Controls.Add(ucThanhToan.Instance);
                ucThanhToan.Instance.Dock = DockStyle.Fill;
                ucThanhToan.Instance.BringToFront();
            }
            else
                ucThanhToan.Instance.BringToFront();
        }

        private void lblLichsutt_Click(object sender, EventArgs e)
        {
            LabelMove(lblLichsutt);
            if (!pnTn.Controls.Contains(ucLichSuThanhToan.Instance))
            {
                pnTn.Controls.Add(ucLichSuThanhToan.Instance);
                ucLichSuThanhToan.Instance.Dock = DockStyle.Fill;
                ucLichSuThanhToan.Instance.BringToFront();
            }
            else
                ucLichSuThanhToan.Instance.BringToFront();
        }
    }
}
