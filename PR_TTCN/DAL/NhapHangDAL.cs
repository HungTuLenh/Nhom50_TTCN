using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class NhapHangDAL
    {
        private static NhapHangDAL instance;

        public static NhapHangDAL Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new NhapHangDAL();
                }
                return NhapHangDAL.instance;
            }
            private set { NhapHangDAL.instance = value; }
        }
        private NhapHangDAL() { }


        public int LayPhieuNhap()
        {
            DataTable dt = DataProvider.Instance.ExecuteQuery("SELECT maphieunhap from tblphieunhaphang where tongtien is null");
            if (dt.Rows.Count > 0)
            {
                PhieuNhap pn = new PhieuNhap(dt.Rows[0]);
                return pn.Mapn;
            }
            return -1;
        }
        public int LayNhapMax()
        {
            try
            {
                return (int)DataProvider.Instance.ExecuteScalar("SELECT MAX(maphieunhap) from tblphieunhaphang");
            }
            catch
            {
                return 1;
            }
        }
        public void ThemPN(string manv, int mancc)
        {
            DataProvider.Instance.ExecuteNonQuery("ProcInsertPhieuNhap @manv , @mancc", new object[] { manv , mancc });
        }

        public void ThemCTPN(int mahd, int mamon, int sl, DateTime hansd)
        {
            DataProvider.Instance.ExecuteNonQuery("ProcInsertChiTietPhieuNhap @mapn , @mahang , @sl , @hansd", new object[] { mahd, mamon, sl, hansd });
        }


        public List<NhaCungCap> LoadNcc()
        {
            List<NhaCungCap> lncc = new List<NhaCungCap>();
            string query = "SELECT MaNCC, TenNCC FROM tblNhaCungCap";
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow dr in dt.Rows)
            {
                NhaCungCap ncc = new NhaCungCap(dr);
                lncc.Add(ncc);
            }
            return lncc;
        }

        public List<CTPhieuNhap> LayDSPN(int mapn)
        {
            List<CTPhieuNhap> lctn = new List<CTPhieuNhap>();

            string query = "SELECT ct.maphieunhap, h.TenHang, ct.SoLuong, ct.hansudung, h.DonGia FROM tblChiTietPhieuNhapHang ct JOIN tblHangHoa h ON ct.MaHang = h.MaHang WHERE ct.MaPhieuNhap = " + mapn;
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow dr in dt.Rows)
            {
                CTPhieuNhap ctn = new CTPhieuNhap(dr);
                lctn.Add(ctn);
            }

            return lctn;
        }
        public void NhapHang(int tongtien, int mapn)
        {
            string query = string.Format("UPDATE tblPhieuNhapHang SET TongTien = {0} WHERE MaPhieuNhap = {1}", tongtien, mapn );
            DataProvider.Instance.ExecuteNonQuery(query);
        }

        public void CapNhapHang(int mahang, int sudung)
        {
            string query = "UpdateSoLuongHangHoa @mahang , @sudung ";
            DataProvider.Instance.ExecuteNonQuery(query, new object[] { mahang, sudung });
        }
    }
}
