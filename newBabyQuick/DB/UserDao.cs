using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using tab_control.Classes;
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
                + "(nom, prenom, gsm, email, types_membre, nb_enfants, date_dispo, date_fin_dispo, password, id_asp, lieux)"
                + "VALUES(@nom, @prenom, @gsm, @email, @types_membre, @nb_enfants, @date_dispo, @date_fin_dispo, @password, @id_asp, @lieux)";
            SqlCommand command = new SqlCommand(requete, bdd.getConnection());
            command.Parameters.Add("@nom", SqlDbType.VarChar).Value = b.Nom;
            command.Parameters.Add("@prenom", SqlDbType.VarChar).Value = b.Prenom;
            command.Parameters.Add("@gsm", SqlDbType.VarChar).Value = b.Gsm;
            command.Parameters.Add("@email", SqlDbType.VarChar).Value = b.Email;
            command.Parameters.Add("@types_membre", SqlDbType.TinyInt).Value = b.Type;
            command.Parameters.Add("@nb_enfants", SqlDbType.TinyInt).Value = 0;
            command.Parameters.Add("@date_dispo", SqlDbType.Date).Value = b.DateDispo;
            command.Parameters.Add("@date_fin_dispo", SqlDbType.Date).Value = b.DateFinDispo;
            command.Parameters.Add("@password", SqlDbType.VarChar).Value = b.Password;
            command.Parameters.Add("@id_asp", SqlDbType.VarChar).Value = b.Id_asp;
            command.Parameters.Add("@lieux", SqlDbType.VarChar).Value = b.Lieux;
            command.CommandType = CommandType.Text;
            command.ExecuteNonQuery();
            bdd.getConnection().Close();
        }

        public void add(Parent p)
        {
            bdd.getConnection().Close();
            bdd.getConnection().Open();
            string requete = "INSERT INTO Membre"
                + "(nom, prenom, gsm, email, types_membre, nb_enfants, date_dispo, password, lieux)"
                + "VALUES(@nom, @prenom, @gsm, @email, @types_membre, @nb_enfants, @date_dispo, @password, @lieux)";
            SqlCommand command = new SqlCommand(requete, bdd.getConnection());
            command.Parameters.Add("@nom", SqlDbType.VarChar).Value = p.Nom;
            command.Parameters.Add("@prenom", SqlDbType.VarChar).Value = p.Prenom;
            command.Parameters.Add("@gsm", SqlDbType.VarChar).Value = p.Gsm;
            command.Parameters.Add("@email", SqlDbType.VarChar).Value = p.Email;
            command.Parameters.Add("@types_membre", SqlDbType.TinyInt).Value = p.Type;
            command.Parameters.Add("@nb_enfants", SqlDbType.TinyInt).Value = p.NbEnfants;
            command.Parameters.Add("@date_dispo", SqlDbType.Date).Value = "NULL";
            command.Parameters.Add("@password", SqlDbType.VarChar).Value = p.Password;
            command.Parameters.Add("@lieux", SqlDbType.VarChar).Value = p.Lieux;
            command.CommandType = CommandType.Text;
            command.ExecuteNonQuery();
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

        public Membre getMembre(String email)
        {
            bdd.getConnection().Close();
            bdd.getConnection().Open();

            SqlCommand command = new SqlCommand("SELECT id, nom, password, prenom, types_membre, gsm, date_dispo, date_fin_dispo, nb_enfants, lieux FROM Membre WHERE email = @email", bdd.getConnection());
            command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            SqlDataReader r = command.ExecuteReader();
            Membre m = null;
            if (r.HasRows)
            {
                while (r.Read())
                {
                    short type = short.Parse(r["types_membre"].ToString());
                   
                    switch (type)
                    {
                        case 0:
                            m = new AdminC(r["nom"] as string, r["prenom"] as string, r["gsm"] as string, email, "null");
                            m.Id = int.Parse(r["id"].ToString());
                            break;
                        case 1:
                            short nbE = short.Parse(r["nb_enfants"].ToString());
                            m = new Parent(r["nom"] as string, r["prenom"] as string, r["gsm"] as string, email, nbE, r["password"] as string, r["lieux"] as string);
                            m.Id = int.Parse(r["id"].ToString());
                            break;
                        case 2:
                            m = new Babysitter(r["nom"] as string, r["prenom"] as string, r["gsm"] as string, email, r["password"] as string, r["date_dispo"] as string, r["date_fin_dispo"] as string, r["lieux"] as string);
                            m.Id = int.Parse(r["id"].ToString());
                            break;
                        case 3:
                            m = new Intermediaire(r["nom"] as string, r["prenom"] as string, r["gsm"] as string, email, "null");
                            m.Id = int.Parse(r["id"].ToString());
                            break;
                    }
                }
            }
            bdd.getConnection().Close();
            return m;
        }

        public Membre getMembre(int id)
        {
            bdd.getConnection().Close();
            bdd.getConnection().Open();

            SqlCommand command = new SqlCommand("SELECT email, nom, prenom, types_membre, gsm, date_dispo, date_fin_dispo, nb_enfants, lieux, password FROM Membre WHERE id = @id", bdd.getConnection());
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            SqlDataReader r = command.ExecuteReader();
            Membre m = null;
            if (r.HasRows)
            {
                while (r.Read())
                {
                    short type = short.Parse(r["types_membre"].ToString());

                    switch (type)
                    {
                        case 0:
                            m = new AdminC(r["nom"] as string, r["prenom"] as string, r["gsm"] as string, r["email"] as string, "null");
                            break;
                        case 1:
                            short nbE = short.Parse(r["nb_enfants"].ToString());
                            m = new Parent(r["nom"] as string, r["prenom"] as string, r["gsm"] as string, r["email"] as string, nbE, r["password"] as string, r["lieux"] as string);
                            m.Id = id;
                            break;
                        case 2:
                            m = new Babysitter(r["nom"] as string, r["prenom"] as string, r["gsm"] as string, r["email"] as string, r["password"] as string, r["date_dispo"] as string, r["date_fin_dispo"] as string, r["lieux"] as string);
                            m.Id = id;
                            break;
                        case 3:
                            m = new Intermediaire(r["nom"] as string, r["prenom"] as string, r["gsm"] as string, r["email"] as string, "null");
                            break;
                    }
                }
            }
            bdd.getConnection().Close();
            return m;
        }

        public List<Babysitter> findAllBabySitter(String dateD, String dateF)
        {
            bdd.getConnection().Open();
            SqlCommand command = new SqlCommand("SELECT nom, prenom , gsm, email, types_membre, lieux FROM Membre WHERE types_membre = 2 AND id IN(SELECT id FROM Membre WHERE date_dispo <= @dateD AND date_fin_dispo >= @dateF)", bdd.getConnection());
            command.Parameters.Add("@dateD", SqlDbType.Date).Value = dateD;
            command.Parameters.Add("@dateF", SqlDbType.Date).Value = dateF;
            SqlDataReader r = command.ExecuteReader();
            List<Babysitter> m = new List<Babysitter>();
            if (r.HasRows)
            {
                while (r.Read())
                {
                    short type = short.Parse(r["types_membre"].ToString());

                    m.Add(new Babysitter(r["nom"] as string, r["prenom"] as string, r["gsm"] as string, r["email"] as string, r["lieux"] as string));
                }
            }
            bdd.getConnection().Close();
            return m;
        }

    }
}