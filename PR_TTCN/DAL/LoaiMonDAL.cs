using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class LoaiMonDAL
    {
        private static LoaiMonDAL instance;

        public static LoaiMonDAL Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new LoaiMonDAL();
                }
                return LoaiMonDAL.instance;
            }
            private set { LoaiMonDAL.instance = value; }
        }
        private LoaiMonDAL() { }

        public List<LoaiMon> LayDSLoaiMon()
        {
            List<LoaiMon> ds = new List<LoaiMon>();
            string query = "select * from tblloaimon";
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow dr in dt.Rows)
            {
                LoaiMon lm = new LoaiMon(dr);
                ds.Add(lm);
            }
            return ds;
        }
    }
}
