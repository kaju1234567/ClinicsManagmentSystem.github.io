using clinic_management.Beans;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management
{
    public partial class Viewpatientforreceptionist : System.Web.UI.Page
    {

        MySqlConnection con;
        public Viewpatientforreceptionist()
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

                        //string dt = DateTime.Parse(txtDate.Value.ToString()+" 00:00:00").ToString("yyyy-MM-dd");
                        //string query = @"SELECT pa.`PatientAppointmentId`,p.`FirstName` AS 'Patient', p.`Email`, d.`FirstName` AS 'Doctor',
                        //         t.`day`,CONCAT(ft.`time`,' - ',`ttime`.`time`) AS 'Timing',c.`ClinicName`,pa.`PatientStatus`,t.day
                        //         FROM `profile` p
                        //         INNER JOIN `patientappointment` pa
                        //         ON p.`ProfileId`=pa.`PatientId`
                        //         INNER JOIN `timetable` t
                        //         ON pa.`TimeTableId`=t.`TimeTableId`
                        //         INNER JOIN `profile` d
                        //         ON d.`ProfileId`=t.`DoctorId`
                        //         INNER JOIN `time` ttime
                        //         ON t.`ToTime`=ttime.`timeid`
                        //         INNER JOIN `time` ft
                        //         ON ft.`timeid`=t.`FromTime`
                        //         INNER JOIN `clinic` c
                        //         ON c.`ClinicId`=t.`ClinicId`
                        //         WHERE p.`UserType`=4 and pa.`PatientStatus`<>'Cancelled' and t.isactive=1
                        //            AND (DATE(pa.`RequestedDateTime`)='"+dt+"' OR DATE(pa.`createddate`)='"+dt+"')  AND t.`ClinicId`=" + user.clinicid;
                        //con.Open();
                        //MySqlCommand cmd = new MySqlCommand("" + query, con);
                        //MySqlDataReader dr = cmd.ExecuteReader();
                        //if (dr.HasRows)
                        //{
                        //    gridReports.DataSource = dr;
                        //    gridReports.DataBind();
                        //    Hidecolumn();

                        //}


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

        protected void btnDltreport_Click(object sender, EventArgs e)
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
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string PatientAppointmentId = gvr.Cells[2].Text.ToString();
                string email = gvr.Cells[4].Text.ToString();
                string doctor = gvr.Cells[5].Text.ToString();
                string day = gvr.Cells[6].Text.ToString();
                string time = gvr.Cells[7].Text.ToString();
                string clinic = gvr.Cells[8].Text.ToString();
                string query = @"UPDATE `cms`.`patientappointment` SET `PatientStatus` = 'Cancelled',`ApprovedBy` = " + user.Id + @", `modifieddate` = NOW(),`Comments` = 'Cancelled',`IsActive` = 1
		                                WHERE `PatientAppointmentId` = " + PatientAppointmentId;
                con.Open();
                
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Write("<script>alert('Appointment has been cancelled....!')</script>");
                    con.Close();

                    // email code start
                    //pa.`PatientAppointmentId`,p.`FirstName` AS 'Patient', p.`Email`,d.`FirstName` AS 'Doctor',
                    //t.`day`,CONCAT(ft.`time`, ' - ',`ttime`.`time`) AS 'Timing',c.`ClinicName`,pa.`PatientStatus`,t.day

                    var fromAddress = new MailAddress("kajubhutrani@gmail.com", "kajubhutrani@gmail.com");
                    var toAddress = new MailAddress("" + email, "");
                    const string fromPassword = "Kajal123/.";
                    const string subject = "Clinic credentials";
                    string body = @"
                                            Dear Sir/Madam,<br/> Following is your appointment schedule has been cancelled.
                                               <br/>

                                            <br/><br/><table border='1' style='border-collapse: collapse; width: 45%; height: 162px;'>  
                                            <tr style = 'height: 20px;' bgcolor = 'Black' >
                                                 <td style = 'width:50%; height: 20px; text-align: center;' colspan = '2' >
                                                     <span style = 'color: #ffffff; font-weight: bold; ' > Doctor Appointment : " + doctor + @" </ span >
                                                  </td>
                                            </tr>
                                            <tr style = 'height: 20px;'>
                                                <td style = 'width:25%;background-color:#7EDC1F; text-align: center;' > Clinic : </ td >
                                                <td style = 'width:25%;text-align: center;font-weight: bold;color: #ffffff;' bgcolor = 'Black' > " + clinic + @"</ td >
                                            </tr >
                                            <tr style = 'height: 20px;' >
                                                   <td style = 'width:25%;background-color:#7EDC1F; text-align: center;' > Day : </ td >
                                                  <td style = 'width:25%;text-align: center;font-weight: bold;color: #ffffff;' bgcolor = 'Black' > " + day + @"</ td >
                                            </tr>
                                            <tr style = 'height: 20px;' >
                                                 <td style = 'width:25%;background-color:#7EDC1F; text-align: center;' > Time : </ td >
                                                 <td style = 'width:25%;text-align: center;font-weight: bold;color: #ffffff;' bgcolor = 'Black' > " + time + @" </ td >
                                             </tr>
                                             </table >";


                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                    };
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        IsBodyHtml = true,
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);
                    }

                    // email code End

                    ViewAppointments();
                    //con.Open();
                    //query = @"SELECT pa.`PatientAppointmentId`,p.`FirstName` AS 'Patient', p.`Email`,d.`FirstName` AS 'Doctor',
                    //             t.`day`,CONCAT(ft.`time`,' - ',`ttime`.`time`) AS 'Timing',c.`ClinicName`,pa.`PatientStatus`
                    //             FROM `profile` p
                    //             INNER JOIN `patientappointment` pa
                    //             ON p.`ProfileId`=pa.`PatientId`
                    //             INNER JOIN `timetable` t
                    //             ON pa.`TimeTableId`=t.`TimeTableId`
                    //             INNER JOIN `profile` d
                    //             ON d.`ProfileId`=t.`DoctorId`
                    //             INNER JOIN `time` ttime
                    //             ON t.`ToTime`=ttime.`timeid`
                    //             INNER JOIN `time` ft
                    //             ON ft.`timeid`=t.`FromTime`
                    //             INNER JOIN `clinic` c
                    //             ON c.`ClinicId`=t.`ClinicId`
                    //             WHERE p.`UserType`=4 and pa.`PatientStatus`<>'Cancelled' and t.isactive=1 AND t.`ClinicId`=" + user.clinicid;
                    //cmd = new MySqlCommand("" + query, con);
                    //gridReports.DataSource = cmd.ExecuteReader();
                    //gridReports.DataBind();
                    //Hidecolumn();
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

                if (gridReports.Rows.Count > 0)
                {
                    gridReports.HeaderRow.Cells[2].Visible = false;
                    // gridReports.HeaderRow.Cells[2].Visible = false;
                    //gridReports.HeaderRow.Cells[2].Visible = false;
                    foreach (GridViewRow gvr in gridReports.Rows)
                    {
                        gvr.Cells[2].Visible = false;
                        if (gvr.Cells[9].Text == "Accepted")
                        {
                            gvr.FindControl("btnAccept").Visible = false;
                        }
                        else if (gvr.Cells[9].Text == "Done")
                        {
                            gvr.FindControl("btnAccept").Visible = false;
                            gvr.FindControl("btnDltreport").Visible = false;
                        }
                        //gvr.Cells[2].Visible = false;


                    }

                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.ToString() + "')</script>");
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
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
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string PatientAppointmentId = gvr.Cells[2].Text.ToString();
                //string email = gvr.Cells[3].Text.ToString();
                string email = gvr.Cells[4].Text.ToString();
                string doctor = gvr.Cells[5].Text.ToString();
                string day = gvr.Cells[6].Text.ToString();
                string time = gvr.Cells[7].Text.ToString();
                string clinic = gvr.Cells[8].Text.ToString();
                string query = @"UPDATE `cms`.`patientappointment` SET `modifieddate` = NOW(),
		                                  `PatientStatus` = 'Accepted',`ApprovedBy` = " + user.Id+ @", `ApprovedDateTime` = NOW(),`Comments` = 'Accepted',`IsActive` = 1
		                                WHERE `PatientAppointmentId` = " + PatientAppointmentId;
                con.Open();
               
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                if (cmd.ExecuteNonQuery()>0)
                {
                    Response.Write("<script>alert('Appointment has been accepted....!')</script>");
                    con.Close();

                    var fromAddress = new MailAddress("kajubhutrani@gmail.com", "kajubhutrani@gmail.com");
                    var toAddress = new MailAddress("" + email, "");
                    const string fromPassword = "Kajal123/.";
                    const string subject = "Clinic credentials";
                    string body = @"
                                            Dear Sir/Madam,<br/> Following is your appointment schedule has been Accepted.
                                               <br/>

                                            <br/><br/><table border='1' style='border-collapse: collapse; width: 45%; height: 162px;'>  
                                            <tr style = 'height: 20px;' bgcolor = 'Black' >
                                                 <td style = 'width:50%; height: 20px; text-align: center;' colspan = '2' >
                                                     <span style = 'color: #ffffff; font-weight: bold; ' > Doctor Appointment : " + doctor + @" </ span >
                                                  </td>
                                            </tr>
                                            <tr style = 'height: 20px;'>
                                                <td style = 'width:25%;background-color:#7EDC1F; text-align: center;' > Clinic : </ td >
                                                <td style = 'width:25%;text-align: center;font-weight: bold;color: #ffffff;' bgcolor = 'Black' > " + clinic + @"</ td >
                                            </tr >
                                            <tr style = 'height: 20px;' >
                                                   <td style = 'width:25%;background-color:#7EDC1F; text-align: center;' > Day : </ td >
                                                  <td style = 'width:25%;text-align: center;font-weight: bold;color: #ffffff;' bgcolor = 'Black' > " + day + @"</ td >
                                            </tr>
                                            <tr style = 'height: 20px;' >
                                                 <td style = 'width:25%;background-color:#7EDC1F; text-align: center;' > Time : </ td >
                                                 <td style = 'width:25%;text-align: center;font-weight: bold;color: #ffffff;' bgcolor = 'Black' > " + time + @" </ td >
                                             </tr>
                                             </table >";


                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                    };
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        IsBodyHtml = true,
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);
                    }
                    ViewAppointments();
                    //query = @"SELECT pa.`PatientAppointmentId`,p.`FirstName` AS 'Patient', p.`Email`, d.`FirstName` AS 'Doctor',
                    //             t.`day`,CONCAT(ft.`time`,' - ',`ttime`.`time`) AS 'Timing',c.`ClinicName`,pa.`PatientStatus`
                    //             FROM `profile` p
                    //             INNER JOIN `patientappointment` pa
                    //             ON p.`ProfileId`=pa.`PatientId`
                    //             INNER JOIN `timetable` t
                    //             ON pa.`TimeTableId`=t.`TimeTableId`
                    //             INNER JOIN `profile` d
                    //             ON d.`ProfileId`=t.`DoctorId`
                    //             INNER JOIN `time` ttime
                    //             ON t.`ToTime`=ttime.`timeid`
                    //             INNER JOIN `time` ft
                    //             ON ft.`timeid`=t.`FromTime`
                    //             INNER JOIN `clinic` c
                    //             ON c.`ClinicId`=t.`ClinicId`
                    //             WHERE p.`UserType`=4  and pa.`PatientStatus`<>'Cancelled' and t.isactive=1 AND t.`ClinicId`=" + user.clinicid;
                    //con.Open();
                    //cmd = new MySqlCommand("" + query, con);
                    //gridReports.DataSource = cmd.ExecuteReader();
                    //gridReports.DataBind();
                    //Hidecolumn();
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

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            try
            {
                ViewAppointments();
            }
            catch (Exception ex)
            {


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
                    string query = @"SELECT pa.`PatientAppointmentId`,p.`FirstName` AS 'Patient', p.`Email`, d.`FirstName` AS 'Doctor',
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
	                                WHERE p.`UserType`=4 and pa.`PatientStatus`<>'Cancelled' and t.isactive=1
                                    AND (DATE(pa.`RequestedDateTime`)='" + dt + "' OR DATE(pa.`createddate`)='" + dt + "')  AND t.`ClinicId`=" + user.clinicid;
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        gridReports.DataSource = dr;
                        gridReports.DataBind();
                        gridReports.Visible = true;
                        lblMsg.Visible = false;
                        Hidecolumn();

                    }

                    else
                    {

                      
                        gridReports.Visible = false;
                        lblMsg.Visible = true;
                        lblMsg.Text = "There is no patient on this date....!";
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

        protected void btnSearch_ServerClick1(object sender, EventArgs e)
        {

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