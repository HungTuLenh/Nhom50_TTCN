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
    }
}
