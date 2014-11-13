using System;
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
            

            String datePr = dateP.Text;
            String dateFi = dateF.Text;
            var test = Request.Form["__EVENTTARGET"];
            //TODO bug a cause des intervals
            if (Page.IsPostBack && datePr != "" && dateFi != "" && test != "ctl00$LoginView$timerNotifs")
            {
                RendezVous rdv = null;
                newBabyQuick.Membre m = Session["membre"] as newBabyQuick.Membre;
                
                if (btnVousMeme.Checked && mailSelected.Text != "")
                {
                    int idB = uD.getMembre(mailSelected.Text).Id;
                    rdv = new RendezVous(DateTime.Now.ToString(), datePr, dateFi, idB, m.Id, listMotifs.Text);
                }
                else if (btnInter.Checked)
                {
                    rdv = new RendezVous(DateTime.Now.ToString(), datePr, dateFi, m.Id, listMotifs.Text);
                }

                if (rdv != null)
                {
                    dateP.Text = ""; dateF.Text = "";
                    RendezVousDao rdvDao = new RendezVousDao(bdd);
                    rdvDao.add(rdv);
                }
                
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

        protected void envoieDates_Click(object sender, EventArgs e)
        {
            if (dateP.Text != "" && dateF.Text != "")
            {
                AdresseParent.Text = ((Parent)Session["membre"]).Lieux;
                List<Babysitter> babysitter = uD.findAllBabySitter(dateP.Text as string, dateF.Text as string);

                listBaby.DataSource = babysitter;
                listBaby.DataBind();

                
            }
            
        }
    }
}