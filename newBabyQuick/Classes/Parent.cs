using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Parent
/// </summary>
/// namespace newBabyQuick
namespace newBabyQuick
{
    public class Parent : Membre
    {
        private short nbEnfants;
        private String lieux;

        public Parent(String nom, String prenom, String gsm, String email, short nbE, String password, String lieux)
        {
            Nom = nom;
            Prenom = prenom;
            Gsm = gsm;
            Type = 1;
            NbEnfants = nbE;
            Email = email;
            Password = password;
            Lieux = lieux;
        }


        public short NbEnfants
        {
            get { return nbEnfants; }
            set { nbEnfants = value; }
        }

        public String Lieux
        {
            get { return lieux; }
            set { lieux = value; }
        }
    }
}