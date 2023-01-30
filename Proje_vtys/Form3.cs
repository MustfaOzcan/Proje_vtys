using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proje_vtys
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }
        //Dikkat3
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localhost;port=5432;Database=Projev1;userID=postgres; password=123456");
        //LISTELE

        private void Form3_Load(object sender, EventArgs e)
        {
            //FORM YUKLENDIGINDE LISTELENSIN
            string sorgu = "select * from tbl_silinenler ";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

        }
    }
}
