using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace newBabyQuick.Classes
{
    public class NotificationLive
    {
        private int id, idMembre;
        private short vu, typeNotif;
        private String message;

        
        public const short MAIL = 1,
                           DEMANDE = 2;

        public NotificationLive(int idMembre, short type)
        {
            IdMembre = idMembre;
            Vu = 0;
            TypeNotif = type;
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public int IdMembre
        {
            get { return idMembre; }
            set { idMembre = value; }
        }     

        public short Vu
        {
            get { return vu; }
            set { vu = value; }
        }

        public short TypeNotif
        {
            get { return typeNotif; }
            set { typeNotif = value; }
        }

        public String Message
        {
            get
            {
                switch (TypeNotif)
                {
                    case MAIL: return "Vous avez reçu un mail !";
                    case DEMANDE: return "Vous avez reçu une nouvelle demande !";
                    default: return "Vous n'avez pas de notification";
                }
            }
            set { message = value; }
        }

    }
}