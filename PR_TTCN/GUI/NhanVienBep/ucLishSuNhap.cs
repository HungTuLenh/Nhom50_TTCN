using DAL;
using DTO;
using GUI.NhanVienThuNgan;
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
    public partial class ucLishSuNhap : UserControl
    {
        private static ucLishSuNhap instance;
        public static ucLishSuNhap Instance
        {
            get
            {
                if (instance == null)
                    instance = new ucLishSuNhap();
                return instance;
            }
        }
        public ucLishSuNhap()
        {
            InitializeComponent();
            LoadDate();
            ShowDSN(tpBd.Value, tpKt.Value);
        }

        void LoadDate()
        {
            DateTime today = DateTime.Now;
            tpBd.Value = new DateTime(today.Year, today.Month, 1);
            tpKt.Value = tpBd.Value.AddMonths(1);
        }

        void ShowDSN(DateTime ngaybd, DateTime ngaykt)
        {
            lvN.Items.Clear();
            List<LSuNhap> ln = NhapHangDAL.Instance.loadDsN(ngaybd, ngaykt);
            int tongDthu = 0;
            foreach (LSuNhap n in ln)
            {
                ListViewItem lvi = new ListViewItem(n.Ngaynhap.ToString());
                lvi.SubItems.Add(n.Tennv.ToString());
                lvi.SubItems.Add(n.Tenncc.ToString());
                lvi.SubItems.Add(n.Tongtien.ToString());
                tongDthu += n.Tongtien;

                lvN.Items.Add(lvi);
            }
            CultureInfo ct = new CultureInfo("vi-VN");
            txtTongdthu.Text = tongDthu.ToString("c", ct);
        }


        private void tpKt_ValueChanged(object sender, EventArgs e)
        {
            ShowDSN(tpBd.Value, tpKt.Value);
        }

        private void tpBd_ValueChanged(object sender, EventArgs e)
        {
            ShowDSN(tpBd.Value, tpKt.Value);
        }
    }
}
