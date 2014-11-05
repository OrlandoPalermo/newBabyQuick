using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tab_control;

namespace newBabyQuick
{
    public partial class AjaxInfoDemande : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Bdd bdd = Bdd.getInstance();
            RendezVousDao rdvDao = new RendezVousDao(bdd);
            UserDao uDao = new UserDao(bdd);

            int idRdv = int.Parse(Request.QueryString["info"]);
            

            if (Request.QueryString["accept"] != null)
            {
                rdvDao.accepted(idRdv);
            }
            else
            {
                RendezVous rdv = rdvDao.getRendezVous(idRdv);
                Parent parent = uDao.getMembre(rdv.IdParent) as Parent;

                NomPrenom.Text = parent.Nom + " " + parent.Prenom;
                nbEnfant.Text = (parent.NbEnfants).ToString();
                Note.Text = rdv.Note;
            }
            
        }

        protected void Accept_Click(object sender, EventArgs e)
        {
            Response.Write("ok");
        }


    }
}