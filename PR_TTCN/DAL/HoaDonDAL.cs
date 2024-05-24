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

        public int LayHoaDonChuaThanhToan(string maban) 
        {
            DataTable dt = DataProvider.Instance.ExecuteQuery("SELECT * from tblhoadonthanhtoan where maban = " + maban + " AND trang thai = 0");
            if( dt.Rows.Count > 0 )
            {
                HoaDon hd = new HoaDon(dt.Rows[0]);
                return hd.MaHd;
            }
            return -1;
        }
        public void ThemHD(HoaDon hd)
        {
            DataProvider.Instance.ExecuteNonQuery("SP_ThemHD @maban , @manv , N'@pttt'", new object[] { hd.MaHd, hd.MaNV, hd.PtThantoan});
        }
        
    }
}
