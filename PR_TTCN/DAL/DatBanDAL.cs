using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DatBanDAL
    {
        private static DatBanDAL instance;

        public static DatBanDAL Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DatBanDAL();
                }
                return DatBanDAL.instance;
            }
            private set { DatBanDAL.instance = value; }
        }
        private DatBanDAL() { }

        public bool Datban(DatBan db)
        {
            string query = string.Format("INSERT tblDatBan (manv, maban, tennguoidat, songuoi, ghichu, thoigian, thongtinlienhe) VALUES ( '{0}', '{1}', N'{2}', {3}, N'{4}', '{5}', '{6}')", db.MaNV, db.MaBan, db.TenNgDat, db.SoNguoi, db.GhiChu, db.ThoiGian.ToString(), db.TtLienhe );
            int rs = DataProvider.Instance.ExecuteNonQuery( query );
            return rs > 0;
        }
        public bool Huydat(DatBan db)
        {
            string query = string.Format("DELETE FROM tblDatBan WHERE maban = '{0}'" , db.MaBan);
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs > 0;
        }
        public bool CapnhatTT (DatBan db)
        {
            string query = string.Format("UPDATE tblBanAn SET TrangThai = N'Trống' WHERE MaBan = '{0}'", db.MaBan);
            int rs = DataProvider.Instance.ExecuteNonQuery(query);
            return rs > 0;
        }
    }
}
