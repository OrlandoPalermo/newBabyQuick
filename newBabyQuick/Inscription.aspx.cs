using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using newBabyQuick.Models;

namespace newBabyQuick
{
    public partial class Inscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
               

                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = new ApplicationUser() { UserName = email.Text, Email = email.Text };
                IdentityResult result = manager.Create(user, password.Text);
                if (result.Succeeded)
                {
                    // Pour plus d'informations sur l'activation de la confirmation du compte et la réinitialisation du mot de passe, consultez http://go.microsoft.com/fwlink/?LinkID=320771
                    //string code = manager.GenerateEmailConfirmationToken(user.Id);
                    //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                    //manager.SendEmail(user.Id, "Confirmez votre compte", "Confirmez votre compte en cliquant <a href=\"" + callbackUrl + "\">ici</a>.");
                    Bdd bdd = Bdd.getInstance();
                    UserDao userDao = new UserDao(bdd);

                    if (parents.Checked)
                    {

                        Parent parent = new Parent(nom.Text as string, prenom.Text as string, gsm.Text as string, email.Text as string, short.Parse(nbEnfants.Text), password.Text as string);
                        parent.Id_asp = user.Id;
                        userDao.add(parent);
                    }

                    else
                    {
                        Babysitter babysitter = new Babysitter(nom.Text as string, prenom.Text as string, gsm.Text as string, email.Text as string, password.Text as string, dateDispo.Text as string, dateFinDispo.Text as string);
                        babysitter.Id_asp = user.Id;
                        userDao.add(babysitter);
                    }

                    IdentityHelper.SignIn(manager, user, isPersistent: false);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
 
                }
                else
                {
                    testAff.Text = result.Errors.FirstOrDefault(); ;
                }

            }
        }
    }
}