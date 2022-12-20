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
    public partial class Viewpatientappointmentfordoctor : System.Web.UI.Page
    {
        MySqlConnection con;
        public Viewpatientappointmentfordoctor()
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
                        string query = @"SELECT pa.`PatientAppointmentId`,pa.`PatientId`,p.`FirstName` AS 'Patient', p.`Email`, d.`FirstName` AS 'Doctor',
	                                t.`day`,CONCAT(ft.`time`,' - ',`ttime`.`time`) AS 'Timing',c.`ClinicName`,pa.`PatientStatus`,t.day
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
	                                INNER JOIN `clinic` c
	                                ON c.`ClinicId`=t.`ClinicId`
	                                WHERE p.`UserType`=4 AND t.`ClinicId`=" + user.clinicid+ " AND pa.`PatientStatus`='Accepted' and t.`DoctorId`=" + user.Id;
                        con.Open();
                        MySqlCommand cmd = new MySqlCommand("" + query, con);
                        gridReports.DataSource = cmd.ExecuteReader();
                        gridReports.DataBind();
                        Hidecolumn();


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

        void Hidecolumn()
        {
            try
            {

                if (gridReports.Rows.Count != 0)
                {
                    gridReports.HeaderRow.Cells[1].Visible = false;
                    gridReports.HeaderRow.Cells[2].Visible = false;
                    foreach (GridViewRow gvr in gridReports.Rows)
                    {
                        gvr.Cells[1].Visible = false;
                        gvr.Cells[2].Visible = false;


                    }
                }
                else
                {
                    Response.Write("<script>alert('You don't have appointments.....!')</script>");
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.ToString() + "')</script>");
            }
        }

        protected void btnAppointed_Click(object sender, EventArgs e)
        {
            try
            {
               
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string PatientAppointmentId = gvr.Cells[1].Text.ToString();
                string PatientId = gvr.Cells[2].Text.ToString();
                if (PatientAppointmentId != "" && PatientAppointmentId != null)
                {
                    Response.Redirect("PatientPrescription.aspx?PatientAppointmentId=" + PatientAppointmentId+ "&PatientId="+ PatientId);
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error : " + ex.Message + "....!')</script>");

            }
            finally
            {
                con.Close();
            }
        }
    }
}