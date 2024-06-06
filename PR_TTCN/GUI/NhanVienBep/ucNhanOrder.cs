using DAL;
using DTO;
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
    public partial class ucNhanOrder : UserControl
    {
        private static ucNhanOrder instance;
        public static ucNhanOrder Instance
        {
            get
            {
                if (instance == null)
                    instance = new ucNhanOrder();
                return instance;
            }
        }
        public ucNhanOrder()
        {
            InitializeComponent();
            LoadBan();
            txtNhanvien.Text = NhanVien.maNV;
        }
        private void btn_Click(object sender, EventArgs e)
        {
            LoadBan();
            string maBan = ((sender as Button).Tag as BanAn).MaBan;
            txtBan.Text = maBan;
            ShowOrder(maBan);
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
                
                btn.Click += btn_Click;

                btn.Tag = ban;

                switch (ban.TT)
                {
                    case "Đang sử dụng":
                        btn.BackColor = Color.FromArgb(82, 99, 81);
                        btn.Text = ban.MaBan + Environment.NewLine + "Có order";
                        break;
                    default:
                        btn.BackColor = Color.LightGray;
                        btn.Text = ban.MaBan + Environment.NewLine + "Trống";
                        break;
                }
                flpBan.Controls.Add(btn);

            }
        }
        void ShowOrder(string maban)
        {
            lvOrder.Items.Clear();
            List<Order> lod = HoaDonDAL.Instance.LayDSOrder(maban);
            foreach (Order od in lod)
            {
                ListViewItem lvi = new ListViewItem(od.TenMon.ToString());
                lvi.SubItems.Add(od.SL.ToString());

                lvOrder.Items.Add(lvi);
            }
            LoadBan();
        }
    }
}
