using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.NhanVienThuNgan
{
    public partial class frmNhanVienThuNgan : Form
    {
        public frmNhanVienThuNgan()
        {
            InitializeComponent();
        }

        private void lblThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }
    }
}
