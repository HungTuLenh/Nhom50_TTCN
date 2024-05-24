using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Order
    {
        public Order(string tenmon, int sl, int gia, int thanhtien = 0 ) 
        {
            this.tenMon = tenmon;
            this.SL = sl;
            this.Gia = gia;
            this.ThanhTien = thanhtien;
        }
        public Order(DataRow row)
        {
            this.TenMon = row["tenmon"].ToString();
            this.SL = (int)row["soluong"];
            this.Gia = (int)row["dongia"];
            this.ThanhTien = (int)row["thanhtien"];
        }

        private int thanhTien;
        private int gia;
        private int sL;
        private string tenMon;

        public string TenMon { get => tenMon; set => tenMon = value; }
        public int SL { get => sL; set => sL = value; }
        public int Gia { get => gia; set => gia = value; }
        public int ThanhTien { get => thanhTien; set => thanhTien = value; }
    }
}
