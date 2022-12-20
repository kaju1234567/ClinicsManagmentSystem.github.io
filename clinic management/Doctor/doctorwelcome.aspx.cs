using clinic_management.Beans;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management
{
    public partial class doctorwelcome : System.Web.UI.Page
    {
        MySqlConnection con;
        public doctorwelcome()
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
            if (Session["Username"] != null)
            {
                Userinfo user = (Userinfo)Session["Username"];
                //Response.Write("Patient is  :" + user.Username);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            try
            {
                con.Open();
                Userinfo user = (Userinfo)Session["Username"];
                string query = @"  SELECT `FirstName`, `LastName`, `Cnic`, `Email`, `Contact`, `Qualification`, `Specialization`,imgsource FROM `cms`.`profile` where ProfileId =" + user.Id;
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

                    Label6.Text = dr["Qualification"].ToString();

                    Label7.Text = dr["Specialization"].ToString();
                    //string imgsource = Server.MapPath("" + dr["imgsource"].ToString());
                    imgProfile.Src = "" + dr["imgsource"].ToString();
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
        