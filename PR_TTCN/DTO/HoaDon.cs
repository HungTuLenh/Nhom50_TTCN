﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class HoaDon
    {
        public HoaDon(string maban, string manv)    
        {
            this.MaBan = maban;
            this.MaNV = manv;
        }
        
        public HoaDon(DataRow row) 
        {
            this.MaHd = (int)row["mahd"];
            this.PtThantoan = row["phuongthuctt"].ToString();
            var thoigianTemp = row["ngaythanhtoan"];
            if (thoigianTemp.ToString() != "")
            {
                this.NgayTT = (DateTime?)thoigianTemp;
            }
            this.TrangThai = (int)row["Trangthai"];
        }

        public HoaDon() { }

        private int maHd;
        private string maBan;
        private string ptThantoan;
        private string maNV;
        private DateTime? ngayTT;
        int trangThai;

        public int MaHd { get => maHd; set => maHd = value; }
        public string PtThantoan { get => ptThantoan; set => ptThantoan = value; }
        public DateTime? NgayTT { get => ngayTT; set => ngayTT = value; }
        public int TrangThai { get => trangThai; set => trangThai = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public string MaBan { get => maBan; set => maBan = value; }
    }
}