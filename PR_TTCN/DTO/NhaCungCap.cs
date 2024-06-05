using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class NhaCungCap
    {
        private int mancc;
        private string tenncc;

        public string Tenncc { get => tenncc; set => tenncc = value; }
        public int Mancc { get => mancc; set => mancc = value; }
    
        public NhaCungCap(DataRow row) 
        {
            this.mancc = (int)row["mancc"];
            this.Tenncc = row["tenncc"].ToString();
        }
    }
}
