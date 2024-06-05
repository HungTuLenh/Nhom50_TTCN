using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class PhieuNhap
    {
        public PhieuNhap(DataRow row)
        {
            this.Mapn = (int)row["maphieunhap"];
        }
        private int mapn;

        public int Mapn { get => mapn; set => mapn = value; }
    }

    public class CTPhieuNhap
    {
        public CTPhieuNhap(DataRow row)
        {
            this.Mapn = (int)row["maphieunhap"];
            this.Tenhang = row["tenhang"].ToString();
            this.Sl = (int)row["soluong"];
            this.Hansd = (DateTime)row["hansudung"];
            this.Dongia = (int)row["dongia"];
        }
        private int mapn;
        private string tenhang;
        private int sl;
        private DateTime hansd;
        private int dongia;

        public DateTime Hansd { get => hansd; set => hansd = value; }
        public int Sl { get => sl; set => sl = value; }
        public int Mapn { get => mapn; set => mapn = value; }
        public string Tenhang { get => tenhang; set => tenhang = value; }
        public int Dongia { get => dongia; set => dongia = value; }
    }
}
