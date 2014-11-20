using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tab_control;

namespace newBabyQuick
{
    public partial class DemandesRecentes : System.Web.UI.Page
    {
        private Membre connectedMember;
        private RendezVousDao rDao;

        protected void Page_init(object sender, EventArgs e)
        {
            Bdd bdd = Bdd.getInstance();
            rDao = new RendezVousDao(bdd);

            connectedMember = ((Membre)Session["membre"]);

            if (connectedMember == null)
            {
                Session["errorSession"] = 1;
                Response.Redirect("index.aspx");
            }
            else
            {
                demandesRec.DataSource = rDao.getDemandesRecentes(connectedMember.Id);
                demandesRec.DataBind();
            }
        }


    }
}