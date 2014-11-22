using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using newBabyQuick.Models;

namespace newBabyQuick
{
    public partial class Connexion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Valider le mot de passe de l'utilisateur
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // Ceci ne compte pas les échecs de connexion pour le verrouillage du compte
                // Pour que les échecs de mot passe déclenchent le verrouillage, utilisez shouldLockout: true
                var result = signinManager.PasswordSignIn(emailText.Text, passwordText.Text, false, shouldLockout: false);

                switch (result)
                {
                    case SignInStatus.Success:
                        
                        Bdd bdd = Bdd.getInstance();
                        UserDao userDao = new UserDao(bdd);

                        Membre m = userDao.getMembre(emailText.Text);

                        //Présent dans la table ASP mais pas dans la table Membre
                        if (m == null)
                            return;

                        Session["membre"] = m;
                        emailText.Text = m.Nom;
                        Response.Redirect("/index.aspx");
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                        Request.QueryString["ReturnUrl"],
                                                        false),
                                          true);
                        break;
                    case SignInStatus.Failure:
                    default:
                
                        break;
                }
            }
        }
    }
}