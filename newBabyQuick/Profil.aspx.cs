using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newBabyQuick
{
    public partial class Profil : System.Web.UI.Page
    {
        private Membre connectedMember;
        protected void Page_init(object sender, EventArgs e)
        {
                connectedMember = (Membre)Session["membre"];
                NomPrenom.Text = connectedMember.Nom + " " + connectedMember.Prenom;
                Gsm.Text = connectedMember.Gsm;
                if (((Membre)connectedMember).Type == 1)
                {
                    NbEnfantProfil.Text = ((Parent)connectedMember).NbEnfants.ToString();
                    lieux.Text = ((Parent)connectedMember).Lieux;
                }

                else
                {
                    dateDispo.Text = ((Babysitter)connectedMember).DateDispo;
                    dateFinDispo.Text = ((Babysitter)connectedMember).DateFinDispo;
                    lieux.Text = ((Babysitter)connectedMember).Lieux;
                }

            
        }

        protected void AcceptModification_Click(object sender, EventArgs e)
        {
            Bdd bdd = Bdd.getInstance();
            UserDao uDao = new UserDao(bdd);

            if (((Membre)connectedMember).Type == 1)
            {
                ((Parent)connectedMember).NbEnfants = short.Parse(NbEnfantProfil.Text);
                ((Parent)connectedMember).Lieux = lieux.Text.ToString();
                uDao.update((Parent)connectedMember);
            }

            else
            {
                ((Babysitter)connectedMember).DateDispo = dateDispo.Text.ToString();
                ((Babysitter)connectedMember).DateFinDispo = dateFinDispo.Text.ToString();
                ((Babysitter)connectedMember).Lieux = lieux.Text.ToString();
                uDao.update((Babysitter)connectedMember);
            }

            Session["membre"] = connectedMember;
            
        }
    }
}