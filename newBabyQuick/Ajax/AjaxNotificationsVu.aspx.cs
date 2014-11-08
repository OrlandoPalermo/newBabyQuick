using newBabyQuick.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newBabyQuick.Ajax
{
    public partial class AjaxNotificationsVu : System.Web.UI.Page
    {
        private Bdd bdd;
        private NotificationLiveDao notDao;
        protected void Page_Load(object sender, EventArgs e)
        {
            bdd = Bdd.getInstance();
            notDao = new NotificationLiveDao(bdd);


        }
    }
}