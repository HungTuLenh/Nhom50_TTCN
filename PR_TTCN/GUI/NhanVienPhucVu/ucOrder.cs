using DAL;
using DTO;
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
    public partial class ucOrder : UserControl
    {
        ChiTietHoaDon ct = new ChiTietHoaDon();
        HoaDon hd = new HoaDon();

        private static ucOrder instance;
        public static ucOrder Instance
        {
            get
            {
                if (instance == null)
                    instance = new ucOrder();
                return instance;
            }
        }
        
        public ucOrder()
        {
            InitializeComponent();
            LoadBan();
            LoadLoaiMon();
            txtNhanvien.Text = NhanVien.maNV;
        }
        void LoadBan()
        {
            flpBan.Controls.Clear();
            List<BanAn> listBan = BanAnDAL.Instance.loadDsBan();

            foreach (BanAn ban in listBan)
            {
                Button btn = new Button()
                {
                    Width = BanAnDAL.BanRong,
                    Height = BanAnDAL.BanCao
                };
                btn.Text = ban.MaBan + Environment.NewLine + ban.TT;
                btn.Click += btn_Click;

                btn.Tag = ban;

                switch (ban.TT)
                {
                    case "Đang sử dụng":
                        btn.BackColor = Color.FromArgb(82, 99, 81);
                        break;
                    case "Đã đặt trước":
                        btn.BackColor = Color.FromArgb(196, 166, 116);
                        break;
                    default:
                        btn.BackColor = Color.LightGray;
                        break;
                }
                flpBan.Controls.Add(btn);

            }
        }
        void LoadLoaiMon()
        {
            List<LoaiMon> dsloai = MonAnDAL.Instance.LayDSLoaiMon();
            cbLoai.DataSource = dsloai;
            cbLoai.DisplayMember = "tenloai";
        }

        void LoadMonBoiLoai(int maloai)
        {
            List<MonAn> dsmon = MonAnDAL.Instance.LayDSMon(maloai);
            cbMon.DataSource = dsmon;
            cbMon.DisplayMember = "tenmon";
        }
        void ShowOrder(string maban)
        {
            lvOrder.Items.Clear();
            List<Order> lod = HoaDonDAL.Instance.LayDSOrder(maban);
            foreach (Order od in lod)
            {
                ListViewItem lvi = new ListViewItem(od.TenMon.ToString());
                lvi.SubItems.Add(od.SL.ToString());
                lvi.SubItems.Add(od.Gia.ToString());
                lvi.SubItems.Add(od.ThanhTien.ToString());

                lvOrder.Items.Add(lvi);
            }
            LoadBan();
        }

        private void btn_Click(object sender, EventArgs e)
        {
            LoadBan();
            string maBan = ((sender as Button).Tag as BanAn).MaBan;
            txtBan.Text = maBan;
            ShowOrder(maBan);
        }

        private void cbLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            int maloai = 0;

            ComboBox cb = sender as ComboBox;
            
            if (cb.SelectedItem == null)
            {
                return;
            }
            LoaiMon selected = cb.SelectedItem as LoaiMon;

            maloai = selected.MaLoai;
            LoadMonBoiLoai(maloai);
        }

        private void btnOrder_Click(object sender, EventArgs e)
        {
            BanAn ban = lvOrder.Tag as BanAn;
            hd.MaBan = txtBan.Text;
            hd.MaNV = txtNhanvien.Text;
            ct.MaHd = HoaDonDAL.Instance.LayHoaDonChuaThanhToan(hd.MaBan);
            ct.MaMon = (cbMon.SelectedItem as MonAn).MaMon;
            ct.Sl = (int)numSl.Value;

            if(txtBan.Text == "")
            {
                MessageBox.Show("Chưa chọn bàn!");
            }
            else
            {
                if(ct.MaHd == -1)
                {
                    HoaDonDAL.Instance.ThemHD(hd);
                    HoaDonDAL.Instance.ThemCTHD(HoaDonDAL.Instance.LayMaHDMax(), ct.MaMon, ct.Sl);
                }
                else
                {
                    HoaDonDAL.Instance.ThemCTHD(ct.MaHd, ct.MaMon, ct.Sl);
                }
            }
            
            ShowOrder(hd.MaBan);
        }

    }
}
