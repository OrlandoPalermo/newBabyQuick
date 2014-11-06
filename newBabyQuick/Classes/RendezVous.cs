﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace tab_control
{
    public class RendezVous
    {
        private String dateEmission, datePrevu, datefin;
        int idBabysitter, idParent, id;

        
        short vu, accept;
        string note;

        public RendezVous(String dateEmi, String datePre, String dateF, int idBa, int idP, string note)
        {
            DateEmission = dateEmi;
            DatePrevu = datePre;
            Datefin = dateF;
            IdBabysitter = idBa;
            IdParent = idP;
            Vu = 0;
            Accept = 0;
            Note = note;
        }

        public RendezVous(String dateEmi, String datePre, String dateF, int idP, string note)
        {
            DateEmission = dateEmi;
            DatePrevu = datePre;
            Datefin = dateF;
            IdParent = idP;
            Vu = 0;
            Accept = 0;
            Note = note;
        }

        public RendezVous(String dateEmi, String datePre, String dateF)
        {
            DateEmission = dateEmi;
            DatePrevu = datePre;
            Datefin = dateF;
        }

        public int IdParent
        {
            get { return idParent; }
            set { idParent = value; }
        }

        public String Datefin
        {
            get { return datefin; }
            set { datefin = value; }
        }

        public String DatePrevu
        {
            get { return datePrevu; }
            set { datePrevu = value; }
        }

        public String DateEmission
        {
            get { return dateEmission; }
            set { dateEmission = value; }
        }

        public int IdBabysitter
        {
            get { return idBabysitter; }
            set { idBabysitter = value; }
        }

        public short Vu
        {
            get { return vu; }
            set { vu = value; }
        }

        public short Accept
        {
            get { return accept; }
            set { accept = value; }
        }

        public string Note
        {
            get { return note; }
            set { note = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

    }
}
