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

            timerList_Tick(null, null);
        }

        protected void ListMail_Click(object sender, BulletedListEventArgs e)
        {
            ListItem li = ListMail.Items[e.Index];
            Id.Text = messages[e.Index].Id.ToString();
            Subject.Text = li.Text;
            Contenu.Text = messages[e.Index].Contenu;
            From.Text = uDao.getMembre(messages[e.Index].IdEnvoyeur).Email;
        }

        protected void sendMail_Click(object sender, EventArgs e)
        {
            Message m = new Message(((Membre)Session["membre"]).Id, uDao.getMembre(destW.Text).Id, sujetW.Text as string, contenuW.Text as string);
            MailSender mS = new MailSender(((Membre)Session["membre"]).Email, destW.Text, sujetW.Text, contenuW.Text);
            mDao.add(m);

            mS.Send();
        }

        protected void timerList_Tick(object sender, EventArgs e)
        {
            Membre member = Session["membre"] as Membre;
            mDao.getMessages(member.Id);

            messages = mDao.getMessages(member.Id);


            ListMail.DataSource = messages;
            ListMail.DataTextField = "Sujet";
            ListMail.DataValueField = "Sujet";
            ListMail.DataBind();

           
            badge.Text = messages.Count.ToString();
        }

        protected void deleteMail_Click(object sender, EventArgs e)
        {
            mDao.delete(int.Parse(Id.Text.ToString()));
            timerList_Tick(null, null);
            clear();
        }

        private void clear()
        {
            Subject.Text = "";
            From.Text = "";
            Id.Text = "";
            Contenu.Text = "";
        }
    }
}