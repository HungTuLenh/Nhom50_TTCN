﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class MonAn
    {
        public MonAn(DataRow row)
        {
            this.MaMon = (int)row["mamon"];
            this.TenMon = row["tenmon"].ToString();
            this.DonGia = (int)row["dongia"];
            this.MaLoai = (int)row["maloai"];
        }
        private int maMon;
        private string tenMon;
        private int donGia;
        private int maLoai;

        public int MaMon { get => maMon; set => maMon = value; }
        public string TenMon { get => tenMon; set => tenMon = value; }
        public int DonGia { get => donGia; set => donGia = value; }
        public int MaLoai { get => maLoai; set => maLoai = value; }
    }

    public class LoaiMon
    {

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
