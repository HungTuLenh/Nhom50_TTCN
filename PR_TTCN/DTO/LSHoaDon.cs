using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class LSHoaDon
    {
        public LSHoaDon(string maban,int tongtien, DateTime ngaytt)
        {
            this.MaBan = maban;
            this.TongTien = tongtien;
            this.NgayTT = ngaytt;
        }
        public LSHoaDon(DataRow row)
        {
            this.MaBan = row["maban"].ToString();
            this.TongTien = (int)row["tongtien"];
            this.NgayTT = (DateTime)row["ngaythanhtoan"];

        }

        private string maBan;
        int tongTien;
        private DateTime ngayTT;

        public string MaBan { get => maBan; set => maBan = value; }
        public int TongTien { get => tongTien; set => tongTien = value; }
        public DateTime NgayTT { get => ngayTT; set => ngayTT = value; }
    }
}
