using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.NhanVienPhucVu
{
    public partial class frmNhanVienPhucVu : Form
    {
        public frmNhanVienPhucVu()
        {
            InitializeComponent();
            LabelMove(lblDatban);
            LabelMove(lblOrder);
        }

        private void LabelMove(Control c)
        {
            lblMove.Height = c.Height;
            lblMove.Top = c.Top;
        }

        public void lblDatban_Click(object sender, EventArgs e)
        {
            LabelMove(lblDatban);
            if (!pnPv.Controls.Contains(ucDatBan.Instance))
            {
                pnPv.Controls.Add(ucDatBan.Instance);
                ucDatBan.Instance.Dock = DockStyle.Fill;
                ucDatBan.Instance.BringToFront();
            }
            else
                ucDatBan.Instance.BringToFront();
        }

        private void lblOrder_Click(object sender, EventArgs e)
        {
            LabelMove(lblOrder);
            if (!pnPv.Controls.Contains(ucOrder.Instance))
            {
                pnPv.Controls.Add(ucOrder.Instance);
                ucOrder.Instance.Dock = DockStyle.Fill;
                ucOrder.Instance.BringToFront();
            }
            else
                ucOrder.Instance.BringToFront();
        }

        private void lblThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void lblDangxuat_Click(object sender, EventArgs e)
        {
            this.Hide();
            this.FormClosed += FrmNhanVienPhucVu_FormClosed;
            frmDangNhap dn = new frmDangNhap();
            dn.Show();
        }
        private void FrmNhanVienPhucVu_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
        
    }
}
