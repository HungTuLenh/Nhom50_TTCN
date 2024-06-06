using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
namespace DAL
{
    public class BanAnDAL
    {
        private static BanAnDAL instance;

        public static BanAnDAL Instance 
        {
            get
            {
                if (instance == null)
                {
                    instance = new BanAnDAL();
                }
                return BanAnDAL.instance;
            }
            private set { BanAnDAL.instance = value; }
        }

        public static int BanRong = 100;
        public static int BanCao = 100;

        private BanAnDAL() { }

        public List<BanAn> loadDsBan()
        {
            List<BanAn> tl = new List<BanAn> ();
            DataTable dt = DataProvider.Instance.ExecuteQuery("SP_LayDSDat");
            foreach (DataRow dr in dt.Rows) 
            { 
                BanAn ban = new BanAn(dr);
                tl.Add(ban);
            }
            return tl;
        }
        public bool Datban(DatBan db)
        {
            string query = string.Format("INSERT tblDatBan (manv, maban, tennguoidat, songuoi, ghichu, thoigian, thongtinlienhe) VALUES ( '{0}', '{1}', N'{2}', {3}, N'{4}', '{5}', '{6}')", db.MaNV, db.MaBan, db.TenNgDat, db.SoNguoi, db.GhiChu, db.ThoiGian.ToString(), db.TtLienhe);
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs > 0;
        }
        public bool Huydat(string maban)
        {
            string query = string.Format("DELETE FROM tblDatBan WHERE maban = '{0}'", maban);
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs > 0;
        }
        public bool CapnhatTT(DatBan db)
        {
            string query = string.Format("UPDATE tblBanAn SET TrangThai = N'Trống' WHERE MaBan = '{0}'", db.MaBan);
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs > 0;
        }
    }
}
