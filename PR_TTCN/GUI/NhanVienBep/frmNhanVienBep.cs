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

namespace GUI.NhanVienBep
{
    public partial class frmNhanVienBep : Form
    {
        public frmNhanVienBep()
        {
            InitializeComponent();
            LabelMove(lblOrder);
            LabelMove(lblHang);
        }

        private void LabelMove(Control c)
        {
            lblMove.Height = c.Height;
            lblMove.Top = c.Top;
        }

        public void lblHang_Click(object sender, EventArgs e)
        {
            LabelMove(lblHang);
            if (!pnB.Controls.Contains(ucHangHoa.Instance))
            {
                pnB.Controls.Add(ucHangHoa.Instance);
                ucHangHoa.Instance.Dock = DockStyle.Fill;
                ucHangHoa.Instance.BringToFront();
            }
            else
                ucHangHoa.Instance.BringToFront();
        }

        //private void lblOrder_Click(object sender, EventArgs e)
        //{
        //    LabelMove(lblHang);
        //    if (!pnPv.Controls.Contains(ucOrder.Instance))
        //    {
        //        pnPv.Controls.Add(ucOrder.Instance);
        //        ucOrder.Instance.Dock = DockStyle.Fill;
        //        ucOrder.Instance.BringToFront();
        //    }
        //    else
        //        ucOrder.Instance.BringToFront();
        //}

        private void lblThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }
        private void lblDangxuat_Click(object sender, EventArgs e)
        {
            this.Hide();
            this.FormClosed += FrmNhanVienBep_FormClosed;
            frmDangNhap dn = new frmDangNhap();
            dn.Show();
        }
        private void FrmNhanVienBep_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
