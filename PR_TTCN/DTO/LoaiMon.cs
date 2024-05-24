using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class LoaiMon
    {
        public LoaiMon(int maloai, string tenloai) 
        {
            this.MaLoai = maloai;
            this.TenLoai = tenloai;
        }

        public LoaiMon(DataRow row)
        {
            this.MaLoai = (int)row["maloai"];
            this.TenLoai = row["tenloai"].ToString();
        }
        private int maLoai;
        private string tenLoai;

        public string TenLoai { get => tenLoai; set => tenLoai = value; }
        public int MaLoai { get => maLoai; set => maLoai = value; }
    }
}
