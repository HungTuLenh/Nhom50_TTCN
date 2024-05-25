using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class OrderDAL
    {
        private static OrderDAL instance;

        public static OrderDAL Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new OrderDAL();
                }
                return OrderDAL.instance;
            }
            private set { OrderDAL.instance = value; }
        }
        private OrderDAL() { }

        public List<Order> LayDSOrder(string maban)
        {
            List<Order> ds = new List<Order>();

            string query = "SELECT mo.tenmon, ct.SoLuong, mo.DonGia, mo.dongia*ct.SoLuong as ThanhTien FROM tblChiTietHDTT AS ct, tblHoaDonThanhToan AS hd, tblmonan AS mo WHERE ct.MaHD = hd.MaHD AND ct.MaMon = mo.MaMon AND hd.trangthai = 0 AND hd.MaBan = '" + maban + "'";
            DataTable dt = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow dr in dt.Rows)
            {
                Order od = new Order(dr);
                ds.Add(od);
            }

            return ds;
        }
    }
}
