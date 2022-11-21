﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using Entity;
using Facade;


namespace Facade
{
    public class FGelenİlac
    {
        public static int Ekleme(EGelenİlac veri)

        {
            int islem = 0;
            try
            {
                SqlCommand komut = new SqlCommand("İlac_GelenİlacEkle", Baglanti.con);
                komut.CommandType = CommandType.StoredProcedure;
                if (komut.Connection.State != ConnectionState.Open)
                {
                    komut.Connection.Open();
                }
                komut.Parameters.AddWithValue("GelenİlacAdi", veri.GelenİlacAdi);
                komut.Parameters.AddWithValue("GelenİlacBarkodNo", veri.GelenİlacBarkodNo);
                komut.Parameters.AddWithValue("GelenİlacUretimTarihi", veri.GelenİlacUretimTarihi);
                komut.Parameters.AddWithValue("GelenİlacTuketimTarihi", veri.GelenİlacTuketimTarihi);
                komut.Parameters.AddWithValue("GelenİlacAlinanFirma", veri.GelenİlacAlinanFirma);
                komut.Parameters.AddWithValue("GelenİlacSatilanFirma", veri.GelenİlacSatilanFirma);

                islem = komut.ExecuteNonQuery();
            }

            catch
            {
                islem = -1;

            }

            return islem;
        }

        public static DataTable Listele()

        {
            SqlDataAdapter adp = new SqlDataAdapter("İlac_GelenİlacListele", Baglanti.con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adp.Fill(dt);
            return dt;
        }

        //---------------------------guncelle--------------------------------

        public static bool Guncelle(EGelenİlac islem)

        {
            SqlCommand komut = new SqlCommand("İlac_GelenİlacYenile", DBaglanti.con);
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("GelenİlacNo", islem.GelenİlacNo);
            komut.Parameters.AddWithValue("GelenİlacAdi", islem.GelenİlacAdi);
            komut.Parameters.AddWithValue("GelenİlacBarkodNo", islem.GelenİlacBarkodNo);
            komut.Parameters.AddWithValue("GelenİlacUretimTarihi", islem.GelenİlacUretimTarihi);
            komut.Parameters.AddWithValue("GelenİlacTuketimTarihi", islem.GelenİlacTuketimTarihi);
            komut.Parameters.AddWithValue("GelenİlacAlinanFirma", islem.GelenİlacAlinanFirma);
            komut.Parameters.AddWithValue("GelenİlacSatilanFirma", islem.GelenİlacSatilanFirma);

            return DBaglanti.ExecuteNonQuery(komut);
        }

        public static bool Sil(EGelenİlac islem)
        {
            SqlCommand komut = new SqlCommand("İlac_GelenİlacSil", DBaglanti.con);
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("GelenİlacNo", islem.GelenİlacNo);
            return DBaglanti.ExecuteNonQuery(komut);
        }

    }
}
