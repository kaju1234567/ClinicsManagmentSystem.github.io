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
    public partial class PatientHistory : System.Web.UI.Page
    {
        MySqlConnection con;
        public PatientHistory()
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
                        string query = @"SELECT p.`FirstName` 'PatientName',d.`FirstName` 'Doctor',c.`ClinicName`,pp.`prescription`,pp.`description`,pa.`PatientStatus`,`pa`.`Fees` 
                                            FROM `profile` p
                                            INNER JOIN `patientappointment` pa
                                            ON p.`ProfileId`=pa.`PatientId`
                                            INNER JOIN `patientappointmentpresciption` pp
                                            ON pp.`appointmentid`=pa.`PatientAppointmentId`
                                            INNER JOIN `profile` d
                                            ON d.`ProfileId`=pp.`doctorid`
                                            INNER JOIN `clinic` c
                                            ON c.`ClinicId`=pp.`clinicid`
                                            WHERE pa.`PatientId`=" + Request.QueryString["PatientId"].ToString() 
                                            +" AND pa.`PatientStatus`='Done' GROUP BY p.`ProfileId`,pa.`PatientAppointmentId`";
                        con.Open();
                        MySqlCommand cmd = new MySqlCommand("" + query, con);
                        gridAppointments.DataSource = cmd.ExecuteReader();
                        gridAppointments.DataBind();
                        con.Close();


                        string queryreports = @"SELECT p.`FirstName` 'Patient',r.`report`,  r.`file`
                                                        FROM `cms`.`patientreports` r
                                                        INNER JOIN `patientappointment` pa
                                                        ON r.`PatientAppointmentId`= pa.`PatientAppointmentId`
                                                        INNER JOIN `profile` p
                                                        ON p.`ProfileId`= pa.`PatientId`
                                                        INNER JOIN `assignpatientreportstodoctor` dr
                                                        ON dr.`patientreportid`=r.`patientreportid`
                                                        WHERE dr.`isactive`=1 AND (DATE(NOW()) BETWEEN dr.`fromdate` AND dr.`todate`)   AND  p.`ProfileId`=  " + Request.QueryString["PatientId"].ToString() 
                                                        + " AND dr.`doctorid`=" + user.Id+" GROUP BY dr.`patientreportstodrid`,r.`patientreportid`";
                        con.Open();
                        cmd = new MySqlCommand("" + queryreports, con);
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


        protected void btnPatienthistory_Click(object sender, EventArgs e)
        {

        }
    }
}