﻿
namespace Proje_vtys
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btn_ekle = new System.Windows.Forms.Button();
            this.btnsil = new System.Windows.Forms.Button();
            this.btnguncelle = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.label10 = new System.Windows.Forms.Label();
            this.dataGridView3 = new System.Windows.Forms.DataGridView();
            this.label11 = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.txtkalori = new System.Windows.Forms.TextBox();
            this.txturun_miktari = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtsef_id = new System.Windows.Forms.TextBox();
            this.txtkategorino = new System.Windows.Forms.TextBox();
            this.txturunfiyat = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtUrunad = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txturunid = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView3)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(376, 85);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersWidth = 5;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(897, 245);
            this.dataGridView1.TabIndex = 1;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // btn_ekle
            // 
            this.btn_ekle.Location = new System.Drawing.Point(17, 71);
            this.btn_ekle.Name = "btn_ekle";
            this.btn_ekle.Size = new System.Drawing.Size(76, 28);
            this.btn_ekle.TabIndex = 2;
            this.btn_ekle.Text = "ekle";
            this.btn_ekle.UseVisualStyleBackColor = true;
            this.btn_ekle.Click += new System.EventHandler(this.btn_ekle_Click);
            // 
            // btnsil
            // 
            this.btnsil.Location = new System.Drawing.Point(106, 71);
            this.btnsil.Name = "btnsil";
            this.btnsil.Size = new System.Drawing.Size(76, 28);
            this.btnsil.TabIndex = 6;
            this.btnsil.Text = "sil";
            this.btnsil.UseVisualStyleBackColor = true;
            this.btnsil.Click += new System.EventHandler(this.btnsil_Click);
            // 
            // btnguncelle
            // 
            this.btnguncelle.Location = new System.Drawing.Point(195, 71);
            this.btnguncelle.Name = "btnguncelle";
            this.btnguncelle.Size = new System.Drawing.Size(76, 28);
            this.btnguncelle.TabIndex = 7;
            this.btnguncelle.Text = "update";
            this.btnguncelle.UseVisualStyleBackColor = true;
            this.btnguncelle.Click += new System.EventHandler(this.btnguncelle_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(284, 71);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(76, 28);
            this.button1.TabIndex = 14;
            this.button1.Text = "yenile";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(17, 371);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(103, 105);
            this.button2.TabIndex = 15;
            this.button2.Text = "Rehber";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // dataGridView2
            // 
            this.dataGridView2.AllowUserToAddRows = false;
            this.dataGridView2.AllowUserToDeleteRows = false;
            this.dataGridView2.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Location = new System.Drawing.Point(18, 535);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.ReadOnly = true;
            this.dataGridView2.RowHeadersWidth = 5;
            this.dataGridView2.RowTemplate.Height = 24;
            this.dataGridView2.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView2.Size = new System.Drawing.Size(540, 153);
            this.dataGridView2.TabIndex = 17;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label10.Location = new System.Drawing.Point(13, 496);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(144, 25);
            this.label10.TabIndex = 18;
            this.label10.Text = "Fiyat Değişimi :";
            // 
            // dataGridView3
            // 
            this.dataGridView3.AllowUserToAddRows = false;
            this.dataGridView3.AllowUserToDeleteRows = false;
            this.dataGridView3.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView3.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView3.Location = new System.Drawing.Point(586, 535);
            this.dataGridView3.Name = "dataGridView3";
            this.dataGridView3.ReadOnly = true;
            this.dataGridView3.RowHeadersWidth = 5;
            this.dataGridView3.RowTemplate.Height = 24;
            this.dataGridView3.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView3.Size = new System.Drawing.Size(166, 153);
            this.dataGridView3.TabIndex = 19;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label11.Location = new System.Drawing.Point(581, 507);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(118, 25);
            this.label11.TabIndex = 20;
            this.label11.Text = "Ürün Sayısı:";
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(142, 371);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(103, 105);
            this.button3.TabIndex = 16;
            this.button3.Text = "Çöp Kutusu";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // panel1
            // 
            this.panel1.BackgroundImage = global::Proje_vtys.Properties.Resources._3156_koyu_gri_renk_g475_1250x1000_t7okbiqy;
            this.panel1.Controls.Add(this.txtkalori);
            this.panel1.Controls.Add(this.txturun_miktari);
            this.panel1.Controls.Add(this.label9);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.txtsef_id);
            this.panel1.Controls.Add(this.txtkategorino);
            this.panel1.Controls.Add(this.txturunfiyat);
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.txtUrunad);
            this.panel1.Controls.Add(this.label8);
            this.panel1.Controls.Add(this.txturunid);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.label6);
            this.panel1.Controls.Add(this.label7);
            this.panel1.Location = new System.Drawing.Point(17, 105);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(344, 225);
            this.panel1.TabIndex = 13;
            // 
            // txtkalori
            // 
            this.txtkalori.Location = new System.Drawing.Point(146, 194);
            this.txtkalori.Name = "txtkalori";
            this.txtkalori.Size = new System.Drawing.Size(100, 22);
            this.txtkalori.TabIndex = 19;
            // 
            // txturun_miktari
            // 
            this.txturun_miktari.Location = new System.Drawing.Point(146, 153);
            this.txturun_miktari.Name = "txturun_miktari";
            this.txturun_miktari.Size = new System.Drawing.Size(100, 22);
            this.txturun_miktari.TabIndex = 18;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(22, 194);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(79, 17);
            this.label9.TabIndex = 17;
            this.label9.Text = "Urun Kalori";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 14);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(56, 17);
            this.label2.TabIndex = 16;
            this.label2.Text = "Urun ID";
            // 
            // txtsef_id
            // 
            this.txtsef_id.Enabled = false;
            this.txtsef_id.Location = new System.Drawing.Point(146, 120);
            this.txtsef_id.Name = "txtsef_id";
            this.txtsef_id.Size = new System.Drawing.Size(100, 22);
            this.txtsef_id.TabIndex = 15;
            this.txtsef_id.Text = "1";
            // 
            // txtkategorino
            // 
            this.txtkategorino.Location = new System.Drawing.Point(146, 91);
            this.txtkategorino.Name = "txtkategorino";
            this.txtkategorino.Size = new System.Drawing.Size(100, 22);
            this.txtkategorino.TabIndex = 14;
            // 
            // txturunfiyat
            // 
            this.txturunfiyat.Location = new System.Drawing.Point(146, 65);
            this.txturunfiyat.Name = "txturunfiyat";
            this.txturunfiyat.Size = new System.Drawing.Size(100, 22);
            this.txturunfiyat.TabIndex = 13;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(20, 68);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(73, 17);
            this.label5.TabIndex = 11;
            this.label5.Text = "Urun Fiyat";
            // 
            // txtUrunad
            // 
            this.txtUrunad.Location = new System.Drawing.Point(146, 37);
            this.txtUrunad.Name = "txtUrunad";
            this.txtUrunad.Size = new System.Drawing.Size(100, 22);
            this.txtUrunad.TabIndex = 9;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(22, 156);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(84, 17);
            this.label8.TabIndex = 12;
            this.label8.Text = "Urun Miktari";
            // 
            // txturunid
            // 
            this.txturunid.Location = new System.Drawing.Point(146, 11);
            this.txturunid.Name = "txturunid";
            this.txturunid.Size = new System.Drawing.Size(100, 22);
            this.txturunid.TabIndex = 8;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(20, 41);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(60, 17);
            this.label3.TabIndex = 11;
            this.label3.Text = "Urun Ad";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(22, -16);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(56, 17);
            this.label4.TabIndex = 11;
            this.label4.Text = "Urun ID";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(20, 94);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(83, 17);
            this.label6.TabIndex = 11;
            this.label6.Text = "Kategori No";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(22, 125);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(46, 17);
            this.label7.TabIndex = 11;
            this.label7.Text = "Şef ID";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.ClientSize = new System.Drawing.Size(1311, 766);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.dataGridView3);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btnguncelle);
            this.Controls.Add(this.btnsil);
            this.Controls.Add(this.btn_ekle);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.Text = "Anasayfa";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView3)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btn_ekle;
        private System.Windows.Forms.Button btnsil;
        private System.Windows.Forms.Button btnguncelle;
        private System.Windows.Forms.TextBox txturunid;
        private System.Windows.Forms.TextBox txtUrunad;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.TextBox txtsef_id;
        private System.Windows.Forms.TextBox txtkategorino;
        private System.Windows.Forms.TextBox txturunfiyat;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtkalori;
        private System.Windows.Forms.TextBox txturun_miktari;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.DataGridView dataGridView3;
        private System.Windows.Forms.Label label11;
    }
}

