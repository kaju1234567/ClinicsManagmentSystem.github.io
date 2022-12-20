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
    public partial class DoctorAppointment : System.Web.UI.Page
    {


        MySqlConnection con;
        public DoctorAppointment()
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
                    //doctor profile details
                    string doctorid = Request.QueryString["doctorid"].ToString();
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
                                    WHERE p.`ProfileId`=" + doctorid + " and tt.isactive=1  and  p.UserType=2 limit 0,10";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    Repeater1.DataSource = dr;
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

            /*
              
             * */
        }
    }
}