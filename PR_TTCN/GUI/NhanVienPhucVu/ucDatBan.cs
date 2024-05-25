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
    public partial class ucDatBan : UserControl
    {
        private static ucDatBan instance;
        public static ucDatBan Instance
        {
            get
            {
                if (instance == null)
                    instance = new ucDatBan();
                return instance;
            }
        }
        DatBan db = new DatBan();
        public ucDatBan()
        {
            InitializeComponent();
            LoadBan();
            txtNhanvien.Text = NhanVien.maNV;
        }

        private void ucDatBan_Load(object sender, EventArgs e)
        {

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

        private void btn_Click(object sender, EventArgs e)
        {
            ResetDatban();
            LoadBan();
            Button btn = (Button)sender;
            BanAn ban = btn.Tag as BanAn;

            txtBan.Text = ban.MaBan;
            txtSoghe.Text = ban.SoGhe.ToString();
            txtTrangthai.Text = ban.TT;
            txtNguoidat.Text = ban.TenNgdat;
            if (ban.ThoiGian.HasValue)
            {
                pThoigian.Value = ban.ThoiGian.Value;
            }
            else
            {
                pThoigian.Value = pThoigian.MinDate;
            }
            cbSonguoi.Text = ban.SoNguoi.ToString();
            txtGhichu.Text = ban.GhiChu;
            txtThongtinlienhe.Text = ban.TtLienhe;

            LoadSoNguoi(ban.SoGhe);
        }

        private void LoadSoNguoi(int Ghe)
        {
            List<int> values = Enumerable.Range(1, Ghe).ToList();
            cbSonguoi.DataSource = values;
        }

        private void btnDat_Click(object sender, EventArgs e)
        {
            txtNguoidat.Enabled = true;
            pThoigian.Enabled = true;
            cbSonguoi.Enabled = true;
            txtGhichu.Enabled = true;
            txtThongtinlienhe.Enabled = true;
        }
        private void ResetDatban()
        {
            txtNguoidat.Enabled = false;
            pThoigian.Enabled = false;
            cbSonguoi.Enabled = false;
            txtGhichu.Enabled = false;
            txtThongtinlienhe.Enabled = false;
        }


        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (txtTrangthai.Text == "Đã đặt trước")
            {
                MessageBox.Show("Bàn đã được đặt trước!");
            }
            else if (txtTrangthai.Text == "Đang sử dụng")
            {
                MessageBox.Show("Bàn đang được sử dụng!");
            }
            else if (txtNguoidat.Text == "" || txtThongtinlienhe.Text == "")
            {
                MessageBox.Show("Chưa nhập đủ thông tin người đặt bàn!");
            }
            
            else
            {
                db.MaNV = txtNhanvien.Text;
                db.MaBan = txtBan.Text;
                db.TenNgDat = txtNguoidat.Text;
                db.SoNguoi = (int)cbSonguoi.SelectedItem;
                db.GhiChu = txtGhichu.Text;
                db.ThoiGian = pThoigian.Value;
                db.TtLienhe = txtThongtinlienhe.Text;

                if(DatBanDAL.Instance.Datban(db))
                {
                    MessageBox.Show("Đặt thành công!");
                
                }
                else
                {
                    MessageBox.Show("Lỗi đặt");
                }
                LoadBan();
                }
            
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            if (txtTrangthai.Text == "Trống")
            {
                MessageBox.Show("Bàn trống!");
            }
            else if (txtTrangthai.Text == "Đang sử dụng")
            {
                MessageBox.Show("Đang sử dụng!");
            }
            else
            {

                db.MaBan = txtBan.Text;

                if (DatBanDAL.Instance.Huydat(db))
                {
                    DatBanDAL.Instance.CapnhatTT(db);
                    MessageBox.Show("Hủy thành công!");

                }
                else
                {
                    MessageBox.Show("Lỗi hủy");
                }
                LoadBan();
            }
        }
    }
}