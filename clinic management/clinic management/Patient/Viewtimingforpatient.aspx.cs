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
    public partial class Viewtimingforpatient : System.Web.UI.Page
    {
        MySqlConnection con;
        public Viewtimingforpatient()
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
                    string query = @"  select t.`TimeTableId`,p.`ProfileId`, p.`FirstName` as 'Patient',t.`DoctorId`,d.`FirstName` as 'Doctor',
                                                t.`day`,concat(ft.`time`,' - ',`ttime`.`time`) as 'Timing',pa.`PatientStatus`,pa.PatientAppointmentId,c.`ClinicName`,IF(DATE(pa.`RequestedDateTime`) IS NULL,'0000-00-00',DATE(pa.`RequestedDateTime`) ) 'Appointmentdate',
                                                if(c.isactive=0 and pa.patientstatus<>'Done','Appointment is cancelled due to clinic has been closed','Done') as 'ClinicStatus'
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
                                                inner join `clinic` c
                                                on c.`ClinicId`=t.`ClinicId`
                                                where p.`UserType`=4 and p.`ProfileId`=" + user.Id+ " order by pa.PatientAppointmentId desc";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr2 = cmd.ExecuteReader();
                    Repeater1.DataSource = dr2;
                    Repeater1.DataBind();
                }


            }
            catch (Exception ex)
            {


            }

            finally
            {
                con.Close();
            }

        }
    }
}