﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace newBabyQuick
{
    public class Bdd
    {
        private SqlConnection connexion;
        private static Bdd instance;

        private Bdd()
        {
            connexion = new SqlConnection("Data Source=213.246.49.103;Initial Catalog=rlandliv46751be15249_babyquick;User ID=rland_admin;Password=helha!7946132536");
        }

        public static Bdd getInstance()
        {
            if (instance == null)
            {
                instance = new Bdd();
            }

            return instance;
        }

        public SqlConnection getConnection()
        {
            return connexion;
        }

        public void Open()
        {
            connexion.Open();
        }
    }
}