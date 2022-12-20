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
    public partial class ConfirmAppointment : System.Web.UI.Page
    {

        MySqlConnection con;
        public ConfirmAppointment()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                con = new MySqlConnection("" + constr);
            }
            catch (Exception ex)
            {


            }
            finally
            {

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //new DateTime().set
                //string d=new DateTime()
                //int yy=
                string qrday = Request.QueryString["day"].ToString().ToLower(); ;
                string year = Request.QueryString["date"].ToString().Split('-')[0];
                string month = Request.QueryString["date"].ToString().Split('-')[1];
                string dd = Request.QueryString["date"].ToString().Split('-')[2];
                string d = new DateTime(Convert.ToInt32(year), Convert.ToInt32(month), Convert.ToInt32(dd)).DayOfWeek.ToString();
                if (qrday == d.ToLower())
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

                        string TimeTableId = Request.QueryString["TimeTableId"].ToString();
                        con.Open();
                        MySqlCommand cmd = new MySqlCommand("SELECT * FROM `patientappointment` pa WHERE pa.`PatientId`=" + user.Id + " AND pa.`TimeTableId`=" + TimeTableId
                            + " AND pa.PatientStatus<>'Cancelled' AND DATE(pa.`RequestedDateTime`)='" + Request.QueryString["date"].ToString() + "'", con);
                        MySqlDataReader drchk = cmd.ExecuteReader();
                        if (drchk.HasRows)
                        {
                            con.Close();
                            lblmsg.Text = "You Already appointment on same date with same doctor.............";

                        }
                        else
                        {
                            con.Close();
                            //doctor profile details

                            con.Open();
                            string query = @" SELECT tt.`TimeTableId`,p.`ProfileId`,p.`FirstName`,p.`Specialization`,p.`Qualification`,
                                        p.`imgsource`,ft.`time` ftime,tot.`time` ttime,tt.`day`,c.`ClinicId`,c.`ClinicName`
                                        FROM `timetable` tt
                                        INNER JOIN `time` ft
                                        ON tt.`FromTime`=ft.`timeid`
                                        INNER JOIN `time` tot
                                        ON tt.`ToTime`=tot.`timeid`
                                        INNER JOIN `profile` p
                                        ON tt.`DoctorId`=p.`ProfileId`
                                        INNER JOIN `clinic` c
                                        ON tt.`ClinicId`=c.`ClinicId`
                                        WHERE tt.TimeTableId=" + TimeTableId;
                            cmd = new MySqlCommand("" + query, con);
                            MySqlDataReader dr = cmd.ExecuteReader();
                            if (dr.HasRows)
                            {


                                string doctor = "";
                                string time = "";
                                string clinic = "";
                                string day = "";

                                while (dr.Read())
                                {
                                    doctor = "" + dr["FirstName"].ToString();
                                    time = "" + dr["ftime"].ToString() + " - " + dr["ttime"].ToString();
                                    clinic = "" + dr["ClinicName"].ToString();
                                    day = "" + dr["day"].ToString();


                                }

                                string insertquery = @"INSERT INTO `cms`.`patientappointment`(`PatientId`,`TimeTableId`,`RequestedDateTime`,`PatientStatus`) " +//,`ApprovedBy`,`ApprovedDateTime`,`Comments`,`Fees`,`IsActive`,`createddate`)
                                                        " VALUES(" + user.Id + ", " + TimeTableId + ", '" + Request.QueryString["date"].ToString() + "', 'Inproccess')";//, 'ApprovedBy', 'ApprovedDateTime', 'Comments','Fees', 1); ";
                                con.Close();
                                con.Open();

                                cmd = new MySqlCommand("" + insertquery, con);
                                if (cmd.ExecuteNonQuery() > 0)
                                {
                                    var fromAddress = new MailAddress("kajubhutrani@gmail.com", "kajubhutrani@gmail.com");
                                    var toAddress = new MailAddress("" + user.Email.ToString(), "");
                                    const string fromPassword = "Kajal123/.";
                                    const string subject = "Clinic credentials";
                                    string body = @"
                                            Dear Sir/Madam,<br/> Following is your appointment schedule.
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

                                    lblmsg.Text = "Appointment is in Proccess, please  check email.............";
                                }
                                else
                                {
                                    lblmsg.Text = "Something is missing.............";
                                }



                            }
                        }




                    }
                }
                else
                {
                    lblmsg.Text = "Doctor is not available on this date....!";
                }
                


            }
            catch (Exception ex)
            {
                lblmsg.Text = "Exception : " + ex.Message.ToString();

            }

            finally
            {
                con.Close();
            }

        }
    }
}