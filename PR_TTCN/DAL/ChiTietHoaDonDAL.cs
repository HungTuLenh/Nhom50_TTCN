using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ChiTietHoaDonDAL
    {
        private static ChiTietHoaDonDAL instance;

        public static ChiTietHoaDonDAL Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new ChiTietHoaDonDAL();
                }
                return ChiTietHoaDonDAL.instance;
            }
            private set { ChiTietHoaDonDAL.instance = value; }
        }
        private ChiTietHoaDonDAL() { }

        public List<ChiTietHoaDon> LayDSChiTietHD(int mahd)
        {
            List<ChiTietHoaDon> dscthd = new List<ChiTietHoaDon>();
            DataTable dt = DataProvider.Instance.ExecuteQuery("select * from tblchitiethoadon where mahd =" + mahd);
            foreach (DataRow dr in dt.Rows)
            {
                ChiTietHoaDon ct = new ChiTietHoaDon(dr);
                dscthd.Add(ct);
            }
            return dscthd;
        }
        public void ThemCTHD(int mahd, int mamon, int sl)
        {
            DataProvider.Instance.ExecuteNonQuery("SP_ThemCTHD @mahd , @mamon , @sl ", new object[] { mahd, mamon, sl});
        }
    }
}
