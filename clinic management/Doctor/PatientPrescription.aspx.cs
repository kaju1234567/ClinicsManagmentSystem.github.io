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
    public partial class PatientPrescription : System.Web.UI.Page
    {


        MySqlConnection con;
        public PatientPrescription()
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
                    //lblusername.Text = user.Username;
                }
                else
                {
                    Response.Redirect("../Login.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error to Complete Appointment')</script>");
            }
        }

        protected void btnSubmit_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = null;
                if (Session["Username"] != null)
                {
                    user = (Userinfo)Session["Username"];
                    //lblusername.Text = user.Username;
                }
                else
                {
                    Response.Redirect("../Login.aspx");
                }

                if (txtDescritpion.Value.ToString() != "" && txtPrescription.Value.ToString() != "")
                {
                    string query = "INSERT INTO `cms`.`patientappointmentpresciption`(`appointmentid`,`prescription`,`description`,`doctorid`,`clinicid`,`isactive`)" +
                    " VALUES(" + Request.QueryString["PatientAppointmentId"].ToString() + ", '" + txtPrescription.Value.ToString() + "', '" + txtDescritpion.Value.ToString() + "', " + user.Id + ", " + user.clinicid
                    + " ,1); ";
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        con.Close();
                        query = @"update `cms`.`patientappointment` set `PatientStatus` = 'Done',`ApprovedBy` = " + user.Id + @",`ApprovedDateTime` = now(),`Comments` = 'Done'
                                    where `PatientAppointmentId` = " + Request.QueryString["PatientAppointmentId"].ToString();
                        con.Open();
                        cmd = new MySqlCommand("" + query, con);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Write("<script>" +
                                " alert('Appointment has been completed....!');" +
                                "  window.location.href='Viewpatientfordoctor.aspx';"+
                                " </script>");

                        }
                        else
                        {
                            Response.Write("<script>alert('Error to Complete Appointment')</script>");
                        }


                    }

                }
                else
                {
                    Response.Write("<script>alert('Fields are missing...!')</script>");

                }
                

                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error : "+ex.Message+"')</script>");
            }
        }
    }
}