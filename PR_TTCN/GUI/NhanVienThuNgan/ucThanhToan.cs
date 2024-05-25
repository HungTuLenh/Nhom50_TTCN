using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.NhanVienThuNgan
{
    public partial class ucThanhToan : UserControl
    {

        HoaDon hd = new HoaDon();
        
        private static ucThanhToan instance;
        public static ucThanhToan Instance
        {
            get
            {
                if (instance == null)
                    instance = new ucThanhToan();
                return instance;
            }
        }

        public ucThanhToan()
        {
            InitializeComponent();
            LoadBan();
            string[] pttt = { "tiền mặt", "chuyển khoản", "thẻ tín dụng" };
            cbPttt.DataSource = pttt;
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
        void ShowOrder(string maban)
        {
            lvOrder.Items.Clear();
            List<Order> lod = OrderDAL.Instance.LayDSOrder(maban);
            int tongTien = 0;
            foreach (Order od in lod)
            {
                ListViewItem lvi = new ListViewItem(od.TenMon.ToString());
                lvi.SubItems.Add(od.SL.ToString());
                lvi.SubItems.Add(od.Gia.ToString());
                lvi.SubItems.Add(od.ThanhTien.ToString());
                tongTien += od.ThanhTien;
                lvOrder.Items.Add(lvi);
            }
            int thue = tongTien * 5 / 100;
            txtThue.Text = thue.ToString();
            int chietKhau = tongTien * (int)numCk.Value / 100;
            int ttFinal = tongTien + thue - chietKhau;

            txtTongtien.Text = ttFinal.ToString();
            LoadBan();
        }
        private void btn_Click(object sender, EventArgs e)
        {
            LoadBan();
            Button btn = (Button)sender;
            BanAn ban = btn.Tag as BanAn;

            txtBan.Text = ban.MaBan;
            txtTT.Text = ban.TT;

            ShowOrder(ban.MaBan);
        }

        private void numCk_ValueChanged(object sender, EventArgs e)
        {
            ShowOrder(txtBan.Text);
        }

        private void btnThanhtoan_Click(object sender, EventArgs e)
        {
            hd.MaHd = HoaDonDAL.Instance.LayHoaDonChuaThanhToan(txtBan.Text);
            hd.TongTien = int.Parse(txtTongtien.Text);
            hd.PtThantoan = cbPttt.Text.ToString(); 
            if(txtTT.Text == "Trống" || txtTT.Text == "Đã đặt trước")
            {
                MessageBox.Show(txtBan.Text + " không có hóa đơn");
            }
            else
            {
                if (hd.MaHd != -1)
                {
                    HoaDonDAL.Instance.ThanhToan(hd);
                    ShowOrder(txtBan.Text);
                    MessageBox.Show("Thanh toán thành công cho " + txtBan.Text);
                }
            }

        }
    }
}
