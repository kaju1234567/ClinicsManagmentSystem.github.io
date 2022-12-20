using clinic_management.Beans;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management
{
    public partial class Admincontent : System.Web.UI.Page
    {
        MySqlConnection con;
        public Admincontent()
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


        protected void Page_Load(object sender, EventArgs e)
        {
            //Userinfo user;
            if (Session["Username"] != null)
            {
                Userinfo user = (Userinfo)Session["Username"];
                //Response.Write("Patient is  :" + user.Username);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            try {
                con.Open();
                Userinfo user = (Userinfo)Session["Username"];
                string query = @"  SELECT `FirstName`, `LastName`, `Cnic`, `Email`, `Contact`, `Address` FROM `cms`.`profile` where ProfileId =" + user.Id;
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                //MySqlDataAdapter da = new MySqlDataAdapter(cmd);

                //DataSet ds = new DataSet();

                //da.Fill(ds);
                while (dr.Read())
                {

                    Label1.Text = dr["FirstName"].ToString();

                    Label2.Text = dr["LastName"].ToString();

                    Label3.Text = dr["Cnic"].ToString();

                    Label4.Text = dr["Email"].ToString();

                    Label5.Text = dr["Contact"].ToString();

                    Label6.Text = dr["Address"].ToString();
                }
                
            }
            catch (Exception ex)
            {


            }

            finally
            {
                con.Close();
            }


        }
    }
}