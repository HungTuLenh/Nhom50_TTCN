using System;
using System.Data;
using System.Data.SqlTypes;

namespace DTO
{
    public class BanAn
    {
        public BanAn(DataRow row)
        {
            this.MaBan = row["maban"].ToString();
            this.SoGhe = (int)row["soghe"];
            this.TT = row["trangthai"].ToString();
            this.TenNgdat = row["tennguoidat"].ToString();
            var thoigianTemp = row["thoigian"];
            if (thoigianTemp.ToString() != "")
            {
                this.ThoiGian = (DateTime?)thoigianTemp;
            }
            var songuoiTemp = row["songuoi"];
            if (songuoiTemp.ToString() != "")
            {
                this.SoNguoi = (int)songuoiTemp;
            }
            this.GhiChu = row["ghichu"].ToString();
            this.TtLienhe = row["thongtinlienhe"].ToString();
        }
        private string maBan;
        private int soGhe;
        private string tT;
        private string tenNgdat;
        private DateTime? thoiGian;
        private int soNguoi;
        private string ghiChu;
        private string ttLienhe;

        public string MaBan { get => maBan; set => maBan = value; }
        public int SoGhe { get => soGhe; set => soGhe = value; }
        public string TT { get => tT; set => tT = value; }
        public string TenNgdat { get => tenNgdat; set => tenNgdat = value; }
        public DateTime? ThoiGian { get => thoiGian; set => thoiGian = value; }
        public int SoNguoi { get => soNguoi; set => soNguoi = value; }
        public string GhiChu { get => ghiChu; set => ghiChu = value; }
        public string TtLienhe { get => ttLienhe; set => ttLienhe = value; }
    }

    public class DatBan
    {
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
