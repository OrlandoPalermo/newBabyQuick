﻿using newBabyQuick.Classes;
using newBabyQuick.DB;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newBabyQuick
{
    public partial class MainPage : System.Web.UI.MasterPage
    {
        private Bdd bdd;
        private NotificationLiveDao notDao;
        private ObservableCollection<NotificationLive> notifs;

        protected void Page_Load(object sender, EventArgs e)
        {
            bdd = Bdd.getInstance();
            notDao = new NotificationLiveDao(bdd);

            if (Request.IsAuthenticated)
            {
         
                BulletedList list = (BulletedList)LoginView.FindControl("dataNotif");


                list.Items.Add(new ListItem("Vous n'avez aucune notifications"));
                list.DataBind();
            }
        }
        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut();
        }

        protected void timerNotifs_Tick(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                //TODO simplification liste => attribut
                int idMembre = ((Membre)Session["membre"]).Id;
                notifs = notDao.read(idMembre);

                BulletedList list = (BulletedList)LoginView.FindControl("dataNotif");
                Label badge = (Label)LoginView.FindControl("badgeNotifs");

                badge.Text = notifs.Count.ToString();

                list.DataSource = notifs;
                list.DataTextField = "Message";
                list.DataValueField = "Message";
                list.DataBind();

                /*if (notifs != null)
                {
                    foreach (NotificationLive not in notifs)
                    {
                        notDao.vu(not.Id);
                    }

                }*/
            }
            
            
              
        }

        protected void notif_Click(object sender, EventArgs e)
        {
 
            if (notifs != null)
            {
                foreach (NotificationLive not in notifs)
                {
                    notDao.vu(not.Id);
                }

                timerNotifs_Tick(null, null);
            }
            
        }

        protected void buttonSeen_ServerClick(object sender, EventArgs e)
        {
            
        }
    }
}