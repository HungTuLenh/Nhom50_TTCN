using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class HangHoa
    {
        private int maHang;
        private string tenHang;
        private int sl;
        private int donGia;
        private string dviTinh;
        private DateTime hanSdung;

        public string TenHang { get => tenHang; set => tenHang = value; }
        public int Sl { get => sl; set => sl = value; }
        public int DonGia { get => donGia; set => donGia = value; }
        public string DviTinh { get => dviTinh; set => dviTinh = value; }
        public DateTime HanSdung { get => hanSdung; set => hanSdung = value; }
        public int MaHang { get => maHang; set => maHang = value; }

        public HangHoa(DataRow row) 
        {
            this.MaHang = (int)row["mahang"];
            this.TenHang = row["tenhang"].ToString();
            this.Sl = (int)row["soluong"];
            this.DonGia = (int)row["dongia"];
            this.DviTinh = row["donvitinh"].ToString();
            this.HanSdung = (DateTime)row["hansudung"];
        }
    }
}
