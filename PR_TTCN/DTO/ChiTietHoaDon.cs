﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ChiTietHoaDon
    {
        public ChiTietHoaDon(int mahd, int mamon, int masl) 
        {
            this.MaHd = mahd;
            this.MaMon = mamon;
            this.Sl = masl;

        }
        public ChiTietHoaDon(DataRow row)
        {
            this.MaHd = (int)row["mahd"];
            this.MaMon = (int)row["mamon"];
            this.Sl = (int)row["soluong"];
        }

        private int maHd;
        private int maMon;
        private int sl;

        public int MaHd { get => maHd; set => maHd = value; }
        public int MaMon { get => maMon; set => maMon = value; }
        public int Sl { get => sl; set => sl = value; }
    }
}
