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

            tickDemandes_Tick(null, null);
            
        }

        protected void tickDemandes_Tick(object sender, EventArgs e)
        {
            List<RendezVous> rdvs = rDao.getRendezVous(Context.User.Identity.Name);
            demandesG.DataSource = rdvs;
            demandesG.DataBind();
        }
    }
}