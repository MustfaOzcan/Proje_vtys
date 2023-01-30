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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        //Dikkat1
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localhost;port=5432;Database=Projev1;userID=postgres; password=123456");
        //LISTELE

       

        private void Form1_Load(object sender, EventArgs e)
        {

            //FORM YUKLENDIGINDE LISTELENSIN
            string sorgu = "select * from  tbl_urun";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            //DATAGRIDVIEW 2 LISTELENSIN
            string sorgu2 = "select * from tbl_urunson  ";
            NpgsqlDataAdapter da2 = new NpgsqlDataAdapter(sorgu2, baglanti);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            dataGridView2.DataSource = ds2.Tables[0];

            //DATAGRIDVIEV3 LISTELE
            string sorgu3= "select * from  tbl_uruntoplam";
            NpgsqlDataAdapter da3 = new NpgsqlDataAdapter(sorgu3, baglanti);
            DataSet ds3 = new DataSet();
            da3.Fill(ds3);
            dataGridView3.DataSource = ds3.Tables[0];






        }
        //YENİLE
        private void button1_Click(object sender, EventArgs e)
        {
            //listeleme
            string sorgu = "SELECT * FROM tbl_urun order by urun_id ";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);

            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        //EKLEME
        private void btn_ekle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("insert into tbl_urun  (urun_id,urun_ad,urun_fiyat,urun_kategori_no,kisi_id_sef,urun_miktar,urun_kalori) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7)", baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse(txturunid.Text));//int
            komut1.Parameters.AddWithValue("@p2", txtUrunad.Text);
            komut1.Parameters.AddWithValue("@p3", int.Parse(txturunfiyat.Text));
            komut1.Parameters.AddWithValue("@p4", int.Parse(txtkategorino.Text));
            komut1.Parameters.AddWithValue("@p5", int.Parse(txtsef_id.Text));
            komut1.Parameters.AddWithValue("@p6", int.Parse(txturun_miktari.Text));
            komut1.Parameters.AddWithValue("@p7", int.Parse(txtkalori.Text));
            komut1.ExecuteNonQuery();//degisikleri veri tabanina yansit
            baglanti.Close();
            MessageBox.Show("Ekleme Başarılı");
            //DATAGRIDVIEW1 listeleme
            string sorgu = "SELECT * FROM tbl_urun  ";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            //DATAGRIDVIEV3 LISTELE
            string sorgu3 = "select * from  tbl_uruntoplam";
            NpgsqlDataAdapter da3 = new NpgsqlDataAdapter(sorgu3, baglanti);
            DataSet ds3 = new DataSet();
            da3.Fill(ds3);
            dataGridView3.DataSource = ds3.Tables[0];



        }
        //DATAGRID VIEWDEN TEXTBOX A VERILERI ALMA
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txturunid.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            txtUrunad.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            txturunfiyat.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            txtkategorino.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            txtsef_id.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            txturun_miktari.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            txtkalori.Text= dataGridView1.CurrentRow.Cells[6].Value.ToString();
        }

        //GUNCELLEME
        private void btnguncelle_Click(object sender, EventArgs e)
        {

            baglanti.Open();
            NpgsqlCommand komut2 = new NpgsqlCommand("UPDATE  tbl_urun SET urun_ad=@p2,urun_fiyat=@p3,urun_kategori_no=@p4,kisi_id_sef=@p5,urun_miktar=@p6,urun_kalori=@p7 WHERE urun_id=@p1", baglanti);
            komut2.Parameters.AddWithValue("@p1", int.Parse(txturunid.Text));//int
            komut2.Parameters.AddWithValue("@p2", txtUrunad.Text);
            komut2.Parameters.AddWithValue("@p3", int.Parse(txturunfiyat.Text));
            komut2.Parameters.AddWithValue("@p4", int.Parse(txtkategorino.Text));
            komut2.Parameters.AddWithValue("@p5", int.Parse(txtsef_id.Text));
            komut2.Parameters.AddWithValue("@p6", int.Parse(txturun_miktari.Text));
            komut2.Parameters.AddWithValue("@p7", int.Parse(txtkalori.Text));
            komut2.ExecuteNonQuery();//degisikleri veri tabanina yansit
            baglanti.Close();
            MessageBox.Show("Guncelleme Başarılı");
            //listeleme
            string sorgu = "SELECT * FROM tbl_urun  ";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            //DATAGRIDVIEW 2 LISTELENSIN
            string sorgu2 = "select * from tbl_urunson  ";
            NpgsqlDataAdapter da2 = new NpgsqlDataAdapter(sorgu2, baglanti);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            dataGridView2.DataSource = ds2.Tables[0];


        }
        //SİLME
        private void btnsil_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut2 = new NpgsqlCommand("DELETE From tbl_urun where urun_id=@p1", baglanti);
            komut2.Parameters.AddWithValue("@p1", int.Parse(txturunid.Text));
            komut2.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Silme Başarılı");
            //DATAGRID1 listeleme
            string sorgu = "SELECT * FROM tbl_urun order by urun_id  ";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            //DATAGRIDVIEW3 LISTELE
            string sorgu3 = "select * from  tbl_uruntoplam";
            NpgsqlDataAdapter da3 = new NpgsqlDataAdapter(sorgu3, baglanti);
            DataSet ds3 = new DataSet();
            da3.Fill(ds3);
            dataGridView3.DataSource = ds3.Tables[0];

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form2 ff = new Form2();
            ff.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form3 ff = new Form3();
            ff.Show();
        }

        
    }
}
