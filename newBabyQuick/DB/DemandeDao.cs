using newBabyQuick.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace newBabyQuick.DB
{

    public class DemandeDao
    {
        private Bdd connection;

        public DemandeDao(Bdd connec)
        {
            connection = connec;
        }

        public void add(Demande d)
        {
            connection.getConnection().Open();

            SqlCommand requete = new SqlCommand("INSERT INTO Demande(id_parents, id_babysitter, vu, accept) VALUES(@idP, @idB, 0, 0)", connection.getConnection());
            requete.Parameters.Add("@idP", SqlDbType.Int).Value = d.IdParent;
            requete.Parameters.Add("@idB", SqlDbType.Int).Value = d.IdBabysitter;
            requete.ExecuteNonQuery();

            connection.getConnection().Close();
        }
        /**
         * Permet de dire que la demande a été vue par le babysitter
         * **/
        public void vu(int idDemande)
        {
            connection.getConnection().Open();

            SqlCommand requete = new SqlCommand("UPDATE Demande SET vu = 1 WHERE id = @id", connection.getConnection());
            requete.Parameters.Add("@id", SqlDbType.Int).Value = idDemande;
            requete.ExecuteNonQuery();

            connection.getConnection().Close();
        }

        public void accepted(int idDemande)
        {
            connection.getConnection().Open();

            SqlCommand requete = new SqlCommand("UPDATE Demande SET accept = 1 WHERE id = @id", connection.getConnection());
            requete.Parameters.Add("@id", SqlDbType.Int).Value = idDemande;
            requete.ExecuteNonQuery();

            connection.getConnection().Close();
        }

        public void delete(int idDemande)
        {
            connection.getConnection().Open();

            SqlCommand requete = new SqlCommand("DELETE FROM Demande WHERE id = @id", connection.getConnection());
            requete.Parameters.Add("@id", SqlDbType.Int).Value = idDemande;
            requete.ExecuteNonQuery();

            connection.getConnection().Close();
        }
    }
}