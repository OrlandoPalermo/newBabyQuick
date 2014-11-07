using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tab_control;

namespace newBabyQuick
{
    public partial class ServiceMail : System.Web.UI.Page
    {
        private Bdd bdd;
        private MessageDao mDao;
        private UserDao uDao;
        private ObservableCollection<Message> messages;

        protected void Page_Load(object sender, EventArgs e)
        {
            bdd = Bdd.getInstance();
            mDao = new MessageDao(bdd);
            uDao = new UserDao(bdd);

            Membre member = Session["membre"] as Membre;
            mDao.getMessages(member.Id);

            messages = mDao.getMessages(member.Id);
            

            ListMail.DataSource = messages;
            ListMail.DataTextField = "Sujet";
            ListMail.DataValueField = "Sujet";
            ListMail.DataBind();

            badge.Text = messages.Count.ToString();
        }

        protected void ListMail_Click(object sender, BulletedListEventArgs e)
        {
            ListItem li = ListMail.Items[e.Index];
            Subject.Text = li.Text;
            Contenu.Text = messages[e.Index].Contenu;
            From.Text = uDao.getMembre(messages[e.Index].IdEnvoyeur).Email;
        }
    }
}