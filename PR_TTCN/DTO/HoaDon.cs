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
        public HoaDon(int mahd, string pttt, DateTime? ngaytt, int tt, string manv)    
        {
            this.MaHd = mahd;
            this.PtThantoan = pttt;
            this.NgayTT = ngaytt;
            this.TrangThai = tt;
            this.MaNV = manv;
        }
        
        public HoaDon(DataRow row) 
        {
            this.MaHd = (int)row["mahd"];
            this.PtThantoan = row["phuongthuctt"].ToString();
            var thoigianTemp = row["ngaythoigian"];
            if (thoigianTemp.ToString() != "")
            {
                this.NgayTT = (DateTime?)thoigianTemp;
            }
            this.TrangThai = (int)row["Trangthai"];
        }

        public HoaDon() { }

        private int maHd;
        private string ptThantoan;
        private string maNV;
        private DateTime? ngayTT;
        int trangThai;

        public int MaHd { get => maHd; set => maHd = value; }
        public string PtThantoan { get => ptThantoan; set => ptThantoan = value; }
        public DateTime? NgayTT { get => ngayTT; set => ngayTT = value; }
        public int TrangThai { get => trangThai; set => trangThai = value; }
        public string MaNV { get => maNV; set => maNV = value; }
    }
}
