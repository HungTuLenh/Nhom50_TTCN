using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class HoaDon
    {
        public HoaDon(int mahd, string maban, string pttt, string manv, DateTime? ngaytt, int tt, int tongtien)    
        {
            this.MaHd = mahd;
            this.MaBan = maban;
            this.PtThantoan = pttt;
            this.MaNV = manv;
            this.NgayTT = ngaytt;
            this.TrangThai = tt;
            this.TongTien = tongtien;
        }
        
        public HoaDon(DataRow row) 
        {
            this.MaHd = (int)row["mahd"];
            this.MaBan = row["maban"].ToString();
            this.PtThantoan = row["phuongthuctt"].ToString();
            this.MaNV = row["manv"].ToString();
            var thoigianTemp = row["ngaythanhtoan"];
            if (thoigianTemp.ToString() != "")
            {
                this.NgayTT = (DateTime?)thoigianTemp;
            }
            this.TrangThai = (int)row["Trangthai"];
            this.TongTien = (int)row["tongtien"];

        }
        
        public HoaDon() { }

        private int maHd;
        private string maBan;
        private string ptThantoan;
        private string maNV;
        private DateTime? ngayTT;
        int trangThai;
        int tongTien;

        public int MaHd { get => maHd; set => maHd = value; }
        public string PtThantoan { get => ptThantoan; set => ptThantoan = value; }
        public DateTime? NgayTT { get => ngayTT; set => ngayTT = value; }
        public int TrangThai { get => trangThai; set => trangThai = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public string MaBan { get => maBan; set => maBan = value; }
        public int TongTien { get => tongTien; set => tongTien = value; }
    }
}
