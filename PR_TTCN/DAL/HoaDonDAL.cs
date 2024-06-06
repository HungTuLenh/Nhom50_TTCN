using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class HoaDonDAL
    {
        private static HoaDonDAL instance;

        public static HoaDonDAL Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new HoaDonDAL();
                }
                return HoaDonDAL.instance;
            }
            private set { HoaDonDAL.instance = value; }
        }
        private HoaDonDAL() { }
        public List<Order> LayDSOrder(string maban)
        {
            List<Order> ds = new List<Order>();

            string query = "SELECT mo.tenmon, ct.SoLuong, mo.DonGia, mo.dongia*ct.SoLuong as ThanhTien FROM tblChiTietHDTT AS ct, tblHoaDonThanhToan AS hd, tblmonan AS mo WHERE ct.MaHD = hd.MaHD AND ct.MaMon = mo.MaMon AND hd.trangthai = 0 AND hd.MaBan = '" + maban + "'";
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow dr in dt.Rows)
            {
                Order od = new Order(dr);
                ds.Add(od);
            }

            return ds;
        }

        public int LayHoaDonChuaThanhToan(string maban) 
        {
            DataTable dt = DataProvider.Instance.ExecuteQuery("SELECT * from tblhoadonthanhtoan where maban = '" + maban + "' AND trangthai = 0");
            if( dt.Rows.Count > 0 )
            {
                HoaDon hd = new HoaDon(dt.Rows[0]);
                return hd.MaHd;
            }
            return -1;
        }
        public void ThemHD(HoaDon hd)
        {
            DataProvider.Instance.ExecuteNonQuery("SP_ThemHD @maban , @manv", new object[] { hd.MaBan, hd.MaNV});
        }
        
        public int LayMaHDMax()
        {
            try
            {
                return (int)DataProvider.Instance.ExecuteScalar("SELECT MAX(mahd) from tblhoadonthanhtoan");
            }
            catch
            {
                return 1;
            }
        }
        public void ThanhToan(HoaDon hd)
        {
            string query = string.Format("UPDATE tblhoadonthanhtoan SET trangthai = 1, ngaythanhtoan = GETDATE(), phuongthuctt = N'{0}', tongtien = {1} WHERE mahd = {2}", hd.PtThantoan, hd.TongTien, hd.MaHd);
            DataProvider.Instance.ExecuteNonQuery(query);
        }


        public List<LSHoaDon> loadDsHD(DateTime ngaybd, DateTime ngaykt)
        {
            List<LSHoaDon> hdl = new List<LSHoaDon>();
            string query = "SP_LayDSHD @ngaybd , @ngaykt";
            DataTable dt = DataProvider.Instance.ExecuteQuery(query, new object[] { ngaybd, ngaykt});
            foreach (DataRow dr in dt.Rows)
            {
                LSHoaDon hd = new LSHoaDon(dr);
                hdl.Add(hd);
            }
            return hdl;
        }

        public void ThemCTHD(int mahd, int mamon, int sl)
        {
            DataProvider.Instance.ExecuteNonQuery("SP_ThemCTHD @mahd , @mamon , @sl ", new object[] { mahd, mamon, sl });
        }
    }
}
