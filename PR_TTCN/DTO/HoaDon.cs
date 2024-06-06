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

    public class ChiTietHoaDon
    {
        public ChiTietHoaDon(DataRow row)
        {
            this.MaHd = (int)row["mahd"];
            this.MaMon = (int)row["mamon"];
            this.Sl = (int)row["soluong"];
        }

        public ChiTietHoaDon() { }
        private int maHd;
        private int maMon;
        private int sl;

        public int MaHd { get => maHd; set => maHd = value; }
        public int MaMon { get => maMon; set => maMon = value; }
        public int Sl { get => sl; set => sl = value; }
    }
    public class Order
    {
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

    public class LSHoaDon
    {
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
