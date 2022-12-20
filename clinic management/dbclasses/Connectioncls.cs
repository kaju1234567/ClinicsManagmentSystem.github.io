using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
namespace clinic_management.dbclasses
{
    
    public class Connectioncls
    {
        MySqlConnection con;
        public Connectioncls()
        {
            try
            {

                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                con = new MySqlConnection("" + constr);

            }
            catch (Exception ex)
            {

            }

        }

        public void Open()
        {
            try
            {
                con.Open();
            }
            catch (Exception ex)
            {


            }

        }
    }
}