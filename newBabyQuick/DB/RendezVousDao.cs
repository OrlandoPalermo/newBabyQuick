using newBabyQuick;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace tab_control
{
    class RendezVousDao
    {
        private Bdd bdd;
        public RendezVousDao(Bdd b)
        {
            this.bdd = b;
        }

        public ObservableCollection<RendezVous> read()
        {
            bdd.getConnection().Open();
            ObservableCollection<RendezVous> list = new ObservableCollection<RendezVous>();

            SqlCommand req = new SqlCommand("SELECT * FROM RendezVous R INNER JOIN Demande D ON R.id_demande = D.id WHERE D.vu = 0", bdd.getConnection());
            SqlDataReader reader = req.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    int idBabysitter = int.Parse(reader["id_babysitter"].ToString());
                    int idDemande = int.Parse(reader["id_demande"].ToString());
                    int idMembre = int.Parse(reader["id_membre"].ToString());

                    RendezVous rendezV = new RendezVous(reader["date_emission"] as string, reader["date_prevu"] as string, reader["date_fin"] as string, idBabysitter, idMembre, reader["note"] as string);
                    list.Add(rendezV);
                }
            }
            bdd.getConnection().Close();
            return list;
        }

        public void add(RendezVous rdv)
        {
            bdd.getConnection().Open();
            SqlCommand req = new SqlCommand("INSERT INTO RendezVous(date_emission, date_prevu, date_fin, id_membre, id_babysitter, note)" +
            "VALUES(@dE, @dP, @dF, @iM, @idB, @n)", bdd.getConnection());

            req.Parameters.Add("@dE", SqlDbType.DateTime).Value = rdv.DateEmission;
            req.Parameters.Add("@dP", SqlDbType.VarChar).Value = rdv.DatePrevu;
            req.Parameters.Add("@dF", SqlDbType.VarChar).Value = rdv.Datefin;
            req.Parameters.Add("@iM", SqlDbType.Int).Value = rdv.IdParent;
            req.Parameters.Add("@idB", SqlDbType.Int).Value = rdv.IdBabysitter;
            req.Parameters.Add("@n", SqlDbType.VarChar).Value = rdv.Note;

            req.ExecuteNonQuery();

            bdd.getConnection().Close();

        }

        public List<RendezVous> getRendezVous(string emailBabysitter)
        {
            bdd.getConnection().Open();
            List<RendezVous> list = new List<RendezVous>();

            SqlCommand req = new SqlCommand("SELECT * FROM RendezVous WHERE id_babysitter = (SELECT id FROM Membre WHERE email = @email) AND accept = 0", bdd.getConnection());
            req.Parameters.Add("@email", SqlDbType.VarChar).Value = emailBabysitter;
            SqlDataReader reader = req.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    int idBabysitter = int.Parse(reader["id_babysitter"].ToString());
                    int idMembre = int.Parse(reader["id_membre"].ToString());

                    RendezVous rendezV = new RendezVous(reader["date_emission"] as string, reader["date_prevu"] as string, reader["date_fin"] as string, idBabysitter, idMembre, reader["note"] as string);
                    list.Add(rendezV);
                }
            }
            bdd.getConnection().Close();
            return list;
        }

        public RendezVous getRendezVous(int idRdv)
        {
            bdd.getConnection().Open();

            SqlCommand req = new SqlCommand("SELECT * FROM RendezVous WHERE id = @id", bdd.getConnection());
            req.Parameters.Add("@id", SqlDbType.Int).Value = idRdv;
            SqlDataReader reader = req.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    int idBabysitter = int.Parse(reader["id_babysitter"].ToString());
                    int idMembre = int.Parse(reader["id_membre"].ToString());

                    RendezVous rendezV = new RendezVous(reader["date_emission"] as string, reader["date_prevu"] as string, reader["date_fin"] as string, idBabysitter, idMembre, reader["note"] as string);
                    return rendezV;
                }
            }
            bdd.getConnection().Close();
            return null;
        }

        public void accepted(int idRdv)
        {
            bdd.getConnection().Open();

            SqlCommand req = new SqlCommand("UPDATE RendezVous SET accept = 1 WHERE id = @id", bdd.getConnection());
            req.Parameters.Add("@id", SqlDbType.Int).Value = idRdv;

            req.ExecuteNonQuery();

            bdd.getConnection().Close();
        }
    }
}
