using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tab_control;

namespace newBabyQuick.PageBabysitter
{
    public partial class Demande : System.Web.UI.Page
    {
        private Bdd bdd;
        private RendezVousDao rDao;
        protected void Page_Load(object sender, EventArgs e)
        {
            bdd = Bdd.getInstance();
            rDao = new RendezVousDao(bdd);

            List<RendezVous> rdvs = rDao.getRendezVous(Context.User.Identity.Name);
            demandes.DataSource = rdvs;
            demandes.DataBind();
            String hell = demandes.Items[1].Cells[0].Text;
            
        }

    }
}