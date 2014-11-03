using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newBabyQuick
{
    public partial class Search : System.Web.UI.Page
    {
        private UserDao uD;
        private Bdd bdd;
        protected void Page_Load(object sender, EventArgs e)
        {
            bdd = Bdd.getInstance();
            uD = new UserDao(bdd);
            List<Babysitter> babysitter = uD.findAllBabySitter();



            listBaby.DataSource = babysitter;
            listBaby.DataBind();
                
        }

        protected void listBaby_SelectedIndexChanged(object sender, EventArgs e)
        {
            Console.WriteLine("coucou");
        }
    }
}