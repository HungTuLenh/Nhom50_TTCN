using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAL;
using DTO;
using GUI.NhanVienBep;
using GUI.NhanVienPhucVu;
using GUI.NhanVienThuNgan;

namespace GUI
{
    public partial class frmDangNhap : Form
    {
        DangNhap dn = new DangNhap();
        public frmDangNhap()
        {
            InitializeComponent();
            lblDangNhap.MouseEnter += new EventHandler(lblDangNhap_MouseEnter);
            lblDangNhap.MouseLeave += new EventHandler(lblDangNhap_MouseLeave);
        }

        private void lblThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void chbHienthi_CheckedChanged(object sender, EventArgs e)
        {
            if (chbHienthi.Checked)
            {
                txtMatkhau.PasswordChar = '\0';
            }
            else
            {
                txtMatkhau.PasswordChar = '*';
            }
        }

        private void lblDangNhap_Click(object sender, EventArgs e)
        {
            dn.MaNV = txtManv.Text;
            dn.Matkhau = txtMatkhau.Text;

            int rs = (int)DangNhap(dn);

            // Thể hiện trả lại kết quả nếu nghiệp vụ không đúng
            switch (rs)
            {
                case 1:
                    NhanVien.maNV = dn.MaNV;
                    this.Hide();
                    this.FormClosed += FrmDangNhap_FormClosed;
                    frmNhanVienPhucVu nvpv = new frmNhanVienPhucVu();
                    nvpv.Show();
                    break;
                case 2:
                    this.Hide();
                    this.FormClosed += FrmDangNhap_FormClosed;
                    frmNhanVienThuNgan nvtn = new frmNhanVienThuNgan();
                    nvtn.Show();
                    break;
                case 3:
                    NhanVien.maNV = dn.MaNV;
                    this.Hide();
                    this.FormClosed += FrmDangNhap_FormClosed;
                    frmNhanVienBep nvb = new frmNhanVienBep();
                    nvb.Show();
                    break;
                default:
                    MessageBox.Show("Tài khoản hoặc mật khẩu không đúng!");
                    break;
            }
        }
        
        object DangNhap(DangNhap dn)
        {
            return DangNhapDAL.Instance.DangNhap(dn);
        }
        private void lblDangNhap_MouseEnter(object sender, EventArgs e)
        {
            lblDangNhap.BackColor = Color.FromArgb(246, 216, 176);
        }
        private void lblDangNhap_MouseLeave(object sender, EventArgs e)
        {
            lblDangNhap.BackColor = Color.FromArgb(206, 176, 126);  
        }
        private void FrmDangNhap_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }


    }
    
}
