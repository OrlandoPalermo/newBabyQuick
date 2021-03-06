﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
namespace newBabyQuick
{
    public class UserDao
    {
        private Bdd bdd;

        public UserDao(Bdd bdd)
        {
            this.bdd = bdd;
        }

        public void add(Babysitter b)
        {
            bdd.getConnection().Close();
            bdd.getConnection().Open();
            string requete = "INSERT INTO Membre"
                + "(nom, prenom, gsm, email, types_membre, nb_enfants, date_dispo, password)"
                + "VALUES(@nom, @prenom, @gsm, @email, @types_membre, @nb_enfants, @date_dispo, @password)";
            SqlCommand command = new SqlCommand(requete, bdd.getConnection());
            command.Parameters.Add("@nom", SqlDbType.VarChar).Value = b.Nom;
            command.Parameters.Add("@prenom", SqlDbType.VarChar).Value = b.Prenom;
            command.Parameters.Add("@gsm", SqlDbType.VarChar).Value = b.Gsm;
            command.Parameters.Add("@email", SqlDbType.VarChar).Value = b.Email;
            command.Parameters.Add("@types_membre", SqlDbType.TinyInt).Value = b.Type;
            command.Parameters.Add("@nb_enfants", SqlDbType.TinyInt).Value = 0;
            command.Parameters.Add("@date_dispo", SqlDbType.VarChar).Value = "NULL";
            command.Parameters.Add("@password", SqlDbType.VarChar).Value = b.Password;
            command.CommandType = CommandType.Text;
            command.ExecuteNonQuery();
            Console.WriteLine("Ok !");
            bdd.getConnection().Close();
        }

        public void add(Parent p)
        {
            bdd.getConnection().Close();
            bdd.getConnection().Open();
            string requete = "INSERT INTO Membre"
                + "(nom, prenom, gsm, email, types_membre, nb_enfants, date_dispo, password)"
                + "VALUES(@nom, @prenom, @gsm, @email, @types_membre, @nb_enfants, @date_dispo, @password)";
            SqlCommand command = new SqlCommand(requete, bdd.getConnection());
            command.Parameters.Add("@nom", SqlDbType.VarChar).Value = p.Nom;
            command.Parameters.Add("@prenom", SqlDbType.VarChar).Value = p.Prenom;
            command.Parameters.Add("@gsm", SqlDbType.VarChar).Value = p.Gsm;
            command.Parameters.Add("@email", SqlDbType.VarChar).Value = p.Email;
            command.Parameters.Add("@types_membre", SqlDbType.TinyInt).Value = p.Type;
            command.Parameters.Add("@nb_enfants", SqlDbType.TinyInt).Value = p.NbEnfants;
            command.Parameters.Add("@date_dispo", SqlDbType.VarChar).Value = "NULL";
            command.Parameters.Add("@password", SqlDbType.VarChar).Value = p.Password;
            command.CommandType = CommandType.Text;
            command.ExecuteNonQuery();
            Console.WriteLine("Ok !");
            bdd.getConnection().Close();
        }



        public void delete(Membre m)
        {
            bdd.getConnection().Open();
            string requete = "DELETE FROM Membre WHERE email = @mail";

            SqlCommand command = new SqlCommand(requete, bdd.getConnection());
            command.Parameters.Add("@mail", SqlDbType.VarChar).Value = m.Email;
            command.ExecuteNonQuery();
            bdd.getConnection().Close();
        }


    }
}