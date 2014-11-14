using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Babysitter
/// </summary>
/// 
namespace newBabyQuick
{
    public class Babysitter : Membre
    {
        private String dateDispo, dateFinDispo, lieux;

        private bool confirm;
        public Babysitter(String nom, String prenom, String gsm, String email, String password, String dateDispo, String dateFinDispo, String lieux)
        {
            Nom = nom;
            Prenom = prenom;
            Gsm = gsm;
            Type = 2;
            Email = email;
            DateDispo = dateDispo;
            DateFinDispo = dateFinDispo;
            Lieux = lieux;
            Password = password;
        }

        public Babysitter(String nom, String prenom, String gsm, String email, String lieux)
        {
            Nom = nom;
            Prenom = prenom;
            Gsm = gsm;
            Type = 2;
            Email = email;
            Lieux = lieux;
        }

        public String DateDispo
        {
            get { return dateDispo; }
            set { dateDispo = value; }
        }

        public bool Confirm
        {
            get { return confirm; }
            set { confirm = value; }
        }

        public String DateFinDispo
        {
            get { return dateFinDispo; }
            set { dateFinDispo = value; }
        }

        public String Lieux
        {
            get { return lieux; }
            set { lieux = value; }
        }
    }
}