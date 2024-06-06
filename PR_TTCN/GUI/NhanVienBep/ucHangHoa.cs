using DAL;
using DTO;
using GUI.NhanVienPhucVu;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.NhanVienBep
{
    public partial class ucHangHoa : UserControl
    {
        int tt;
        private static ucHangHoa instance;
        public static ucHangHoa Instance
        {
            get
            {
                if (instance == null)
                    instance = new ucHangHoa();
                return instance;
            }
        }
        public ucHangHoa()
        {
            InitializeComponent();
            ShowHH();
            LoadNCC();
            txtNhanvien.Text = NhanVien.maNV;
            LoadHH();
            if (NhapHangDAL.Instance.LayPhieuNhap() != -1)
            {
                LoadDSN();
            }
            txtSl.KeyPress += new KeyPressEventHandler(txtSo_KeyPress);
            txtSdung.KeyPress += new KeyPressEventHandler(txtSo_KeyPress);
        }
        void LoadNCC()
        {
            List<NhaCungCap> lncc = NhapHangDAL.Instance.LoadNcc();
            cbNcc.ValueMember = "Mancc";
            cbNcc.DisplayMember = "Tenncc";
            cbNcc.DataSource = lncc;

        }
        void LoadHH()
        {
            List<HangHoa> hh = HangHoaDAL.Instance.loadHH();
            cbHH.ValueMember = "Mahang";
            cbHH.DisplayMember = "Tenhang";
            cbHH.DataSource = hh;

            cbH.ValueMember = "Mahang";
            cbH.DisplayMember = "Tenhang";
            cbH.DataSource = hh;

        }
        void LoadDSN()
        {
            lvDs.Items.Clear();
            int tongtien = 0;
            List<CTPhieuNhap> lct = NhapHangDAL.Instance.LayDSPN(NhapHangDAL.Instance.LayPhieuNhap());
            foreach (CTPhieuNhap ct in lct)
            {
                ListViewItem lvi = new ListViewItem(ct.Tenhang.ToString());
                lvi.SubItems.Add(ct.Sl.ToString());
                lvi.SubItems.Add(ct.Hansd.ToString());
                lvi.SubItems.Add(ct.Dongia.ToString());
                lvi.SubItems.Add((ct.Sl*ct.Dongia).ToString());
                tongtien += ct.Sl * ct.Dongia;
                lvDs.Items.Add(lvi);
            }
            tt = tongtien;
            txtTongtien.Text = tongtien.ToString("N0");
        }

        void ShowHH(string search = "")
        {
            lvH.Items.Clear();
            List<HangHoa> lh = HangHoaDAL.Instance.loadHH(); 
            foreach (HangHoa hh in lh)
            {
                if ((string.IsNullOrEmpty(search) || hh.TenHang.ToString().ToLower().Contains(search) ))
                {
                    ListViewItem lvi = new ListViewItem(hh.TenHang.ToString());
                    lvi.SubItems.Add(hh.Sl.ToString());
                    lvi.SubItems.Add(hh.DonGia.ToString());
                    lvi.SubItems.Add(hh.DviTinh.ToString());
                    lvi.SubItems.Add(hh.HanSdung.ToString());

                    lvH.Items.Add(lvi);
                }
            }
        }

        private void txtTimkiem_TextChanged(object sender, EventArgs e)
        {
            ShowHH(txtTimkiem.Text);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if(txtSl.Text == "")
            {
                MessageBox.Show("Chưa nhập đủ thông tin để thêm!");
            }
            else
            {
                if (NhapHangDAL.Instance.LayPhieuNhap() == -1)
                {
                    NhapHangDAL.Instance.ThemPN(txtNhanvien.Text, (int)cbNcc.SelectedValue);
                    NhapHangDAL.Instance.ThemCTPN(NhapHangDAL.Instance.LayNhapMax(), (int)cbHH.SelectedValue, Int32.Parse(txtSl.Text), pThoigian.Value);
                    LoadDSN();
                    ShowHH();
                    txtSl.Text = "";
                }
                else
                {
                    NhapHangDAL.Instance.ThemCTPN(NhapHangDAL.Instance.LayPhieuNhap(), (int)cbHH.SelectedValue, Int32.Parse(txtSl.Text), pThoigian.Value);
                    LoadDSN();
                    ShowHH();
                    txtSl.Text = "";
                }
            }
        }

        private void btnNhap_Click(object sender, EventArgs e)
        {
            if(lvDs.Items.Count == 0)
            {
                MessageBox.Show("Không có hàng để nhập!");

            }
            else
            {
                NhapHangDAL.Instance.NhapHang(tt, NhapHangDAL.Instance.LayPhieuNhap());
                LoadDSN();
                ShowHH();
            }
        }

        private void btnCapnhat_Click(object sender, EventArgs e)
        {
            if (txtSdung.Text == "")
            {
                MessageBox.Show("Không có số lượng để cập nhật!");

            }
            else
            {
                NhapHangDAL.Instance.CapNhapHang((int)cbH.SelectedValue, Int32.Parse(txtSdung.Text));
                ShowHH();
            }
        }

        private void txtSo_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }
    }
}
