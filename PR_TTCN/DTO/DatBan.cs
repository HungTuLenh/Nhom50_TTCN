using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DatBan
    {
        public DatBan(string manv, string maban, string tenngdat, int songuoi, string ghichu, DateTime tgian, string ttlienhe)
        {
            this.maNV = manv;
            this.maBan = maban;
            this.tenNgDat = tenngdat;
            this.soNguoi = songuoi;
            this.ghiChu = ghichu;
            this.thoiGian = tgian;
            this.ttLienhe = ttlienhe;
        }
        public DatBan(DataRow row)
        {
            this.TenNgDat = row["tennguoidat"].ToString();
            this.SoNguoi = (int)row["songuoi"];
            this.GhiChu = row["ghichu"].ToString();
            this.ThoiGian = (DateTime)row["thoigian"];
            this.TtLienhe = row["thongtinlienhe"].ToString();
        }
        public DatBan() { }

        private string maNV;
        private string maBan;
        private string tenNgDat;
        private int soNguoi;
        private string ghiChu;
        private DateTime thoiGian;
        private string ttLienhe;

        public string MaNV { get => maNV; set => maNV = value; }
        public string MaBan { get => maBan; set => maBan = value; }
        public string TenNgDat { get => tenNgDat; set => tenNgDat = value; }
        public int SoNguoi { get => soNguoi; set => soNguoi = value; }
        public string GhiChu { get => ghiChu; set => ghiChu = value; }
        public DateTime ThoiGian { get => thoiGian; set => thoiGian = value; }
        public string TtLienhe { get => ttLienhe; set => ttLienhe = value; }
    }
}
