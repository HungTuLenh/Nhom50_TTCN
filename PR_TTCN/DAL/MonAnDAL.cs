using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class MonAnDAL
    {
        private static MonAnDAL instance;

        public static MonAnDAL Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MonAnDAL();
                }
                return MonAnDAL.instance;
            }
            private set { MonAnDAL.instance = value; }
        }
        private MonAnDAL() { }

        public List<MonAn> LayDSMon(int maloai)
        {
            List<MonAn> ds = new List<MonAn>();
            string query = "select * from tblmonan where maloai = " + maloai;
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow dr in dt.Rows)
            {
                MonAn lm = new MonAn(dr);
                ds.Add(lm);
            }
            return ds;
        }
    }
}
