using clinic_management.Beans;
using clinic_management.dbclasses;
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
    public partial class Uploadreportforpatient : System.Web.UI.Page
    {
        Singuporsignin singuporsignin = null;

        MySqlConnection con;
        public Uploadreportforpatient()
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

                if (Page.IsPostBack == false)
                {
                    con.Open();
                    string query = @"select r.`patientreportid`, p.`FirstName` as 'Patient',d.`FirstName` as 'Doctor',
	                                t.`day`,concat(ft.`time`,' - ',`ttime`.`time`) as 'Timing',r.`report`
	                                from `profile` p
	                                inner join `patientappointment` pa
	                                on p.`ProfileId`=pa.`PatientId`
	                                inner join `timetable` t
	                                on pa.`TimeTableId`=t.`TimeTableId`
	                                inner join `profile` d
	                                on d.`ProfileId`=t.`DoctorId`
	                                inner join `time` ttime
	                                on t.`ToTime`=ttime.`timeid`
	                                inner join `time` ft
	                                on ft.`timeid`=t.`FromTime`
	                                inner join `patientreports` r
	                                on r.`PatientAppointmentId`=pa.`PatientAppointmentId`
	                                where p.`UserType`=4 and p.ProfileId=" + user.Id+ " AND pa.`PatientAppointmentId`="+Request.QueryString["PatientAppointmentId"].ToString();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    gridReports.DataSource = cmd.ExecuteReader();
                    gridReports.DataBind();
                    Hidecolumn();

                }
            } catch (Exception ex)
            {


            }
            finally {
                con.Close();
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];
                singuporsignin = new Singuporsignin();
                if (txtTitle.Text.Length > 0 && txtTitle.Text.Length > 0 && FileUploadDoctorimage.HasFile)
                {

                    con.Open();
                    //string query = "Select * from profile p where p.email='" + txtEmail.Text + "'";
                    //MySqlCommand cmd = new MySqlCommand("" + query, con);
                    //MySqlDataReader dr = cmd.ExecuteReader();
                    string query = @"insert into `cms`.`patientreports`(`PatientAppointmentId`,`report`,`file`,`isactive`)
                                    values(" + Request.QueryString["PatientAppointmentId"].ToString() +", '"+txtTitle.Text.ToString()+"', '"+ "files//" + FileUploadDoctorimage.FileName + "', '1'); ";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        FileUploadDoctorimage.SaveAs(Server.MapPath("files//" + FileUploadDoctorimage.FileName));
                        con.Close();
                        con.Open();
                        query = @"select r.`patientreportid`, p.`FirstName` as 'Patient',d.`FirstName` as 'Doctor',
	                                t.`day`,concat(ft.`time`,' - ',`ttime`.`time`) as 'Timing',r.`report`
	                                from `profile` p
	                                inner join `patientappointment` pa
	                                on p.`ProfileId`=pa.`PatientId`
	                                inner join `timetable` t
	                                on pa.`TimeTableId`=t.`TimeTableId`
	                                inner join `profile` d
	                                on d.`ProfileId`=t.`DoctorId`
	                                inner join `time` ttime
	                                on t.`ToTime`=ttime.`timeid`
	                                inner join `time` ft
	                                on ft.`timeid`=t.`FromTime`
	                                inner join `patientreports` r
	                                on r.`PatientAppointmentId`=pa.`PatientAppointmentId`
	                                where p.`UserType`=4 and p.ProfileId="+user.Id + " AND pa.`PatientAppointmentId`=" + Request.QueryString["PatientAppointmentId"].ToString();
                        cmd = new MySqlCommand("" + query, con);
                        gridReports.DataSource=cmd.ExecuteReader();
                        gridReports.DataBind();
                        Hidecolumn();

                        //hide id's

                        Response.Write("<script>alert('Record has been inserted')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Something is missing during uploading...!')</script>");
                    }

                }
                else {

                    Response.Write("<script>alert('Fields are missing....!')</script>");
                }
            }
            catch (Exception ex)

            {
                Response.Write("<script>alert('Error:" + ex.Message + "')</script>");
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
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string patientreportid = gvr.Cells[1].Text.ToString();
                string query = @"delete from `cms`.`patientreports` where `patientreportid` = '" + patientreportid + "';";
                con.Open();
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Userinfo user = (Userinfo)Session["Username"];
                    con.Close();

                    con.Open();
                    query = @"select r.`patientreportid`, p.`FirstName` as 'Patient',d.`FirstName` as 'Doctor',
	                                t.`day`,concat(ft.`time`,' - ',`ttime`.`time`) as 'Timing',r.`report`
	                                from `profile` p
	                                inner join `patientappointment` pa
	                                on p.`ProfileId`=pa.`PatientId`
	                                inner join `timetable` t
	                                on pa.`TimeTableId`=t.`TimeTableId`
	                                inner join `profile` d
	                                on d.`ProfileId`=t.`DoctorId`
	                                inner join `time` ttime
	                                on t.`ToTime`=ttime.`timeid`
	                                inner join `time` ft
	                                on ft.`timeid`=t.`FromTime`
	                                inner join `patientreports` r
	                                on r.`PatientAppointmentId`=pa.`PatientAppointmentId`
	                                where p.`UserType`=4 and p.ProfileId=" + user.Id;
                    cmd = new MySqlCommand("" + query, con);
                    gridReports.DataSource = cmd.ExecuteReader();
                    gridReports.DataBind();
                    Hidecolumn();
                }
                else
                {
                    Response.Write("<script>alert('Something is missing....!')</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Exception:"+ex.Message+"')</script>");
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
                gridReports.HeaderRow.Cells[2].Visible = false;
                foreach (GridViewRow gvr in gridReports.Rows)
                {
                    gvr.Cells[1].Visible = false;


                }
            }
            catch (Exception ex)
            {

            }
        }


    }
}