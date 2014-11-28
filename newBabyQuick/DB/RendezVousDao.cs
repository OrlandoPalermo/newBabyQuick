using newBabyQuick;
using newBabyQuick.Classes;
using newBabyQuick.DB;
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
        private NotificationLiveDao not;
        public RendezVousDao(Bdd b)
        {
            this.bdd = b;
            not = new NotificationLiveDao(b);
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
            req.Parameters.Add("@dP", SqlDbType.Date).Value = rdv.DatePrevu;
            req.Parameters.Add("@dF", SqlDbType.Date).Value = rdv.Datefin;
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

            SqlCommand req = new SqlCommand("SELECT * FROM RendezVous WHERE id_babysitter = (SELECT id FROM Membre WHERE email = @email) AND accept IS NULL", bdd.getConnection());
            req.Parameters.Add("@email", SqlDbType.VarChar).Value = emailBabysitter;
            SqlDataReader reader = req.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    int idBabysitter = int.Parse(reader["id_babysitter"].ToString());
                    int idMembre = int.Parse(reader["id_membre"].ToString());

                    RendezVous rendezV = new RendezVous(reader["date_emission"].ToString(), reader["date_prevu"].ToString(), reader["date_fin"].ToString(), idBabysitter, idMembre, reader["note"] as string);
                    rendezV.Id = int.Parse(reader["id"].ToString());
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
                    bdd.getConnection().Close();
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
            not.add(new NotificationLive(getRendezVous(idRdv).IdParent, NotificationLive.ACCEPTE));

        }

        public void refused(int idRdv)
        {
            bdd.getConnection().Open();

            SqlCommand req = new SqlCommand("UPDATE RendezVous SET id_babysitter = 0 WHERE id = @id", bdd.getConnection());
            req.Parameters.Add("@id", SqlDbType.Int).Value = idRdv;

            req.ExecuteNonQuery();

            bdd.getConnection().Close();
        }

    
        public ObservableCollection<RendezVous> getDemandesRecentes(int idParent) {
            bdd.getConnection().Open();

            SqlCommand req = new SqlCommand("SELECT * FROM RendezVous WHERE id_membre = @id", bdd.getConnection());
            req.Parameters.Add("@id", SqlDbType.Int).Value = idParent;

            ObservableCollection<RendezVous> rdvsRecents = new ObservableCollection<RendezVous>();

            SqlDataReader read = req.ExecuteReader();

            if (read.HasRows) {
                while (read.Read()) {
                    RendezVous rdv = new RendezVous(read["date_emission"].ToString(), read["date_prevu"].ToString(), read["date_fin"].ToString(), int.Parse(read["id_babysitter"].ToString()), int.Parse(read["id_membre"].ToString()), read["note"].ToString());

                    try
                    {
                       rdv.Accept = short.Parse(read["accept"].ToString());
                    }
                    catch (Exception parse)
                    {
                        rdv.Accept = 0;
                    }
                    rdvsRecents.Add(rdv);
                }
            }

            bdd.getConnection().Close();
            return rdvsRecents;
        }
    }
}
