using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace DAL
{
    public class DangNhapDAL
    {
        private static DangNhapDAL instance;

        public static DangNhapDAL Instance {
            get
            {
                if (instance == null)
                {
                    instance = new DangNhapDAL();
                }
                return DangNhapDAL.instance;
            }
            private set { instance = value; }
        }

        private DangNhapDAL() { }
        public object DangNhap(DangNhap dn)
        {
            string query = "SP_DangNhap @manv , @mk";

            object kq = DataProvider.Instance.ExecuteScalar(query, new object[] { dn.MaNV, dn.Matkhau });
            
            return kq;
        }
    }
}

