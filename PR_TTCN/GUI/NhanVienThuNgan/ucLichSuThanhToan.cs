using DAL;
using DTO;
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

namespace GUI.NhanVienThuNgan
{
    public partial class ucLichSuThanhToan : UserControl
    {
        private static ucLichSuThanhToan instance;
        public static ucLichSuThanhToan Instance
        {
            get
            {
                if (instance == null)
                    instance = new ucLichSuThanhToan();
                return instance;
            }
        }

        public ucLichSuThanhToan()
        {
            InitializeComponent();
            LoadDate();
            ShowDSHD(tpBd.Value, tpKt.Value);
        }

        void LoadDate()
        {
            DateTime today = DateTime.Now;
            tpBd.Value = new DateTime(today.Year, today.Month, 1);
            tpKt.Value = tpBd.Value.AddMonths(1).AddDays(-1);
        }

        void ShowDSHD(DateTime ngaybd, DateTime ngaykt)
        {
            lvHD.Items.Clear();
            List<LSHoaDon> lhd = HoaDonDAL.Instance.loadDsHD(ngaybd, ngaykt);
            int tongDthu = 0;
            foreach (LSHoaDon hd in lhd)
            {
                ListViewItem lvi = new ListViewItem(hd.MaBan.ToString());
                lvi.SubItems.Add(hd.TongTien.ToString());
                lvi.SubItems.Add(hd.NgayTT.ToString());
                tongDthu += hd.TongTien;

                lvHD.Items.Add(lvi);
            }
            CultureInfo ct = new CultureInfo("vi-VN");
            txtTongdthu.Text = tongDthu.ToString("c", ct);
        }

        private void btnThongke_Click(object sender, EventArgs e)
        {
            ShowDSHD(tpBd.Value, tpKt.Value);  
        }
    }
}
