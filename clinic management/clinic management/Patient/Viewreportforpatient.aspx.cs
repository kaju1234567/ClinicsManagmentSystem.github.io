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
    public partial class Viewreportforpatient : System.Web.UI.Page
    {

        MySqlConnection con;
        public Viewreportforpatient()
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
                if (user != null)
                {
                    if (Page.IsPostBack == false)
                    {
                       
                        string queryreports = @"SELECT r.`patientreportid`, p.`FirstName` AS 'Patient',d.`FirstName` AS 'Doctor',
                                                        t.`day`,CONCAT(ft.`time`,' - ',`ttime`.`time`) AS 'Timing',r.`report`,r.`file`
                                                        FROM `profile` p
                                                        INNER JOIN `patientappointment` pa
                                                        ON p.`ProfileId`=pa.`PatientId`
                                                        INNER JOIN `timetable` t
                                                        ON pa.`TimeTableId`=t.`TimeTableId`
                                                        INNER JOIN `profile` d
                                                        ON d.`ProfileId`=t.`DoctorId`
                                                        INNER JOIN `time` ttime
                                                        ON t.`ToTime`=ttime.`timeid`
                                                        INNER JOIN `time` ft
                                                        ON ft.`timeid`=t.`FromTime`
                                                        INNER JOIN `patientreports` r
                                                        ON r.`PatientAppointmentId`=pa.`PatientAppointmentId`
                                                        WHERE p.`UserType`=4 AND p.ProfileId="+user.Id;
                        con.Open();
                        MySqlCommand cmd = new MySqlCommand("" + queryreports, con);
                        gridReports.DataSource = cmd.ExecuteReader();
                        gridReports.DataBind();
                        con.Close();
                                               
                    }


                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message.ToString() + "')</script>");
            }
            finally
            {
                con.Close();
            }

        }
    }
}