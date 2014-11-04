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

                    RendezVous rendezV = new RendezVous(reader["date_emission"] as string, reader["date_prevu"] as string, reader["date_fin"] as string, idDemande, idBabysitter, idMembre);
                    list.Add(rendezV);
                }
            }
            bdd.getConnection().Close();
            return list;
        }

        public void add(RendezVous rdv)
        {
            bdd.getConnection().Open();
            SqlCommand reqRdv = new SqlCommand("INSERT INTO RendezVous(date_emission, date_prevu, date_fin, id_demande, id_membre, note)" +
            "VALUES(@dE, @dP, @dF, @iD, @iM, @n)", bdd.getConnection());
            SqlCommand reqDemande = new SqlCommand("INSERT INTO Demande(id, id_babysitter) VALUES(@ID, @idB)", bdd.getConnection());
            SqlParameter param = new SqlParameter("@ID", SqlDbType.Int);
            param.Direction = ParameterDirection.Output;
            reqDemande.Parameters.Add("@idB", SqlDbType.Int).Value = rdv.IdBabysitter;
            reqDemande.Parameters.Add(param);
            reqDemande.ExecuteNonQuery();
            

            Console.WriteLine(param.Value);
            bdd.getConnection().Close();

        }
    }
}
