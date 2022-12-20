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
    public partial class CancelAppointmentPatient : System.Web.UI.Page
    {
        MySqlConnection con;
        public CancelAppointmentPatient()
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
            try
            {
                Userinfo user = null;
                if (Session["Username"] != null)
                {
                    user = (Userinfo)Session["Username"];

                }
                else
                {
                    Response.Redirect("../Login.aspx");
                }
                if (Page.IsPostBack == false)
                {

                    //clinic details
                    con.Open();
                    string query = @"  UPDATE `cms`.`patientappointment` SET `PatientStatus` = 'Cancelled',IsActive=0
                                        WHERE `PatientAppointmentId` = " + Request.QueryString["PatientAppointmentId"].ToString();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>Alert('Appointment has been cancelled');</script>");
                        Response.Redirect("Viewtimingforpatient.aspx");
                    }
                    else
                    {
                        Response.Write("<script>Alert('Missing something....!');</script>");
                        Response.Redirect("Viewtimingforpatient.aspx");
                    }
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>Alert('Error to Updated....!');</script>");
                Response.Redirect("Viewtimingforpatient.aspx");
            }

            finally
            {
                con.Close();
            }

        }
    }
}