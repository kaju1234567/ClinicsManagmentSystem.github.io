using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace clinic_management
{
    public class DatabaseClass
    {
        MySqlConnection con;
        public DatabaseClass()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                con = new MySqlConnection("" + constr);
             
            }
            catch(Exception ex)
            {

            }
        }

        public string connect()
        {
            string msg = "";
            try
            {
                con.Open();
                msg = "connected...";
            }
            catch (Exception ex)
            {
                msg = "error" + ex.Message;
            }
            return msg;
        }
    }
}