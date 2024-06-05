using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class HangHoaDAL
    {
        private static HangHoaDAL instance;

        public static HangHoaDAL Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new HangHoaDAL();
                }
                return HangHoaDAL.instance;
            }
            private set { HangHoaDAL.instance = value; }
        }
        private HangHoaDAL() { }

        public List<HangHoa> loadHH()
        {
            List<HangHoa> lh = new List<HangHoa>();
            string query = "SELECT * FROM tblHangHoa;";
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow dr in dt.Rows)
            {
                HangHoa hh = new HangHoa(dr);
                lh.Add(hh);
            }
            return lh;
        }
    }
}
