using newBabyQuick.Classes;
using newBabyQuick.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newBabyQuick
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["errorSession"] != null)
            {
                Bdd bdd = Bdd.getInstance();
                UserDao uDao = new UserDao(bdd);

                Session["membre"] = uDao.getMembre(Context.User.Identity.Name);
                Session["errorSession"] = null;
            }
        }
    }
}