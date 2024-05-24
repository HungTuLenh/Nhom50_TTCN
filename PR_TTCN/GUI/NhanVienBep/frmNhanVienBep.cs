using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.NhanVienBep
{
    public partial class frmNhanVienBep : Form
    {
        public frmNhanVienBep()
        {
            InitializeComponent();
        }

        private void lblThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }
    }
}
