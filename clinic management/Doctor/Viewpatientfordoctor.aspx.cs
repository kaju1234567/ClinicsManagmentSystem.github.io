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
    public partial class Viewpatientfordoctor : System.Web.UI.Page
    {
        MySqlConnection con;
        public Viewpatientfordoctor()
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
                        string date = DateTime.Now.Date.ToString("MM/dd/yyyy");
                        txtDate.Value = date;
                        ViewAppointments();
                        

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

        public void ViewAppointments()
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
                    string dt = DateTime.Parse(txtDate.Value.ToString() + " 00:00:00").ToString("yyyy-MM-dd");
                    string query = @"SELECT pa.`PatientId`,pa.`PatientAppointmentId`,p.`FirstName` AS 'Patient', p.`Email`, d.`FirstName` AS 'Doctor',
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
	                                WHERE p.`UserType`=4 
                                    AND (DATE(pa.`RequestedDateTime`)='" + dt + "' OR DATE(pa.`createddate`)='" + dt + "') AND t.`ClinicId`=" + user.clinicid + " AND (pa.`PatientStatus`='Done' OR pa.`PatientStatus`='Accepted') and t.`DoctorId`=" + user.Id + "  Group by pa.`PatientId`";
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                   
                    MySqlDataReader dr= cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        gridReports.DataSource = dr;
                        gridReports.DataBind();
                        Hidecolumn();
                        lblMsg.Visible = false;

                    }
                    else
                    {

                        lblMsg.Visible = true;
                        lblMsg.Text = "There is no patient....!";
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
                    // gridReports.HeaderRow.Cells[2].Visible = false;
                    //gridReports.HeaderRow.Cells[2].Visible = false;
                    foreach (GridViewRow gvr in gridReports.Rows)
                    {
                        gvr.Cells[1].Visible = false;
                        gvr.Cells[2].Visible = false;
                        //gvr.Cells[2].Visible = false;


                    }
                }
                else
                {
                    Response.Write("<script>alert('You don't have Patients for history.....!')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.ToString() + "')</script>");
            }
        }

        protected void btnViewhistory_Click(object sender, EventArgs e)
        {
            try
            {

                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string PatientId = gvr.Cells[1].Text.ToString();
                if (PatientId != null && PatientId != "")
                {
                    Response.Redirect("PatientHistory.aspx?PatientId="+ PatientId);
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

        protected void btnSearchbydate_ServerClick(object sender, EventArgs e)
        {
            try
            {
                ViewAppointments();
            }
            catch (Exception ex)
            {

            }
        }
    }
}