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
    public partial class Collectfeeforreceptionist : System.Web.UI.Page
    {

        MySqlConnection con;
        public Collectfeeforreceptionist()
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
	                                t.`day`,CONCAT(ft.`time`,' - ',`ttime`.`time`) AS 'Timing',c.`ClinicName`,pa.`PatientStatus`,`pa`.`Fees`
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
                                    AND (DATE(pa.`RequestedDateTime`)='" + dt + "' OR DATE(pa.`createddate`)='" + dt + "')  AND t.`ClinicId`=" + user.clinicid + " AND pa.`PatientStatus`='Accepted'  Group by pa.`PatientId`,pa.`PatientAppointmentId`";
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        gridPatients.DataSource = dr;
                        gridPatients.DataBind();
                        gridPatients.Visible = true;
                        Panel1.Visible = true;
                        lblMsg.Visible = false;
                        Hidecolumn();

                    }
                    else
                    {

                        Panel1.Visible = false;
                        gridPatients.Visible = false;
                        lblMsg.Visible = true;
                        lblMsg.Text = "There is no patient for fees collection....!";
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

                if (gridPatients.Rows.Count != 0)
                {
                    gridPatients.HeaderRow.Cells[1].Visible = false;
                    gridPatients.HeaderRow.Cells[2].Visible = false;
                    // gridReports.HeaderRow.Cells[2].Visible = false;
                    //gridReports.HeaderRow.Cells[2].Visible = false;
                    foreach (GridViewRow gvr in gridPatients.Rows)
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
                //Response.Write("<sc

            }
        }

        protected void btnFees_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string PatientAppointmentId = gvr.Cells[2].Text.ToString();
                ViewState["PatientAppointmentId"] = PatientAppointmentId;
                txtCollectfees.Value = gvr.Cells[10].Text.ToString();
            }
            catch (Exception ex)
            {  }
        }

      
        protected void btnCollectfees_ServerClick(object sender, EventArgs e)
        {
            try
            {
                string appointmentid = (string)ViewState["PatientAppointmentId"];
                if (txtCollectfees.Value.ToString() != null && txtCollectfees.Value.ToString() != "" && txtCollectfees.Value.ToString() != "0" && appointmentid!=null && appointmentid != "")
                {
                    
                    string query = @"UPDATE `cms`.`patientappointment`
                                            SET   `Fees` = "+txtCollectfees.Value.ToString()+@"
                                            WHERE `PatientAppointmentId` = "+ appointmentid;
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        txtCollectfees.Value = "";
                        Response.Write("<script>alert('fees has been collected.....!')</script>");
                        con.Close();
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
                        ViewAppointments();

                    }
                }
                else
                {
                    Response.Write("Alert('Please fill required fields....!')");
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("Alert('Exception to collect fees : "+ex.Message+"')");
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

        protected void btnsearchwithdate_ServerClick(object sender, EventArgs e)
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
