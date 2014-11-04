﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tab_control;

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

            if (Page.IsPostBack)
            {
                Console.WriteLine(Session.ToString());
                newBabyQuick.Membre m = Session["membre"] as newBabyQuick.Membre;
                String datePr = dateP.Text;
                String dateFi = dateF.Text;
                int idB = uD.getMembre(mailSelected.Text).Id;
                RendezVous rdv = new RendezVous(DateTime.Now.ToString(), datePr, dateFi, m.Id, idB);
                RendezVousDao rdvDao = new RendezVousDao(bdd);
                rdvDao.add(rdv);
            }
            
                
        }

        protected void listBaby_SelectedIndexChanged(object sender, EventArgs e)
        {
            Console.WriteLine("coucou");
        }

        protected void submit_demande_Click(object sender, EventArgs e)
        {
           
            //Response.Redirect("/Search.aspx");
        }
    }
}