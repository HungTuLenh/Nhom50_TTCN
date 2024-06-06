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
            LabelMove(lblLsuNhap);
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

        private void lblLsuNhap_Click(object sender, EventArgs e)
        {
            LabelMove(lblLsuNhap);
            if (!pnB.Controls.Contains(ucLishSuNhap.Instance))
            {
                pnB.Controls.Add(ucLishSuNhap.Instance);
                ucLishSuNhap.Instance.Dock = DockStyle.Fill;
                ucLishSuNhap.Instance.BringToFront();
            }
            else
                ucLishSuNhap.Instance.BringToFront();
        }

        private void lblOrder_Click(object sender, EventArgs e)
        {
            LabelMove(lblOrder);
            if (!pnB.Controls.Contains(ucNhanOrder.Instance))
            {
                pnB.Controls.Add(ucNhanOrder.Instance);
                ucNhanOrder.Instance.Dock = DockStyle.Fill;
                ucNhanOrder.Instance.BringToFront();
            }
            else
                ucNhanOrder.Instance.BringToFront();
        }
    }
}
