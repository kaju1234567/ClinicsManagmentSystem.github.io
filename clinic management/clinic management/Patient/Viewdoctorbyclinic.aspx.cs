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
    public partial class Viewdoctorbyclinic : System.Web.UI.Page
    {
        MySqlConnection con;
        public Viewdoctorbyclinic()
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
                    con.Open();
                    string query = @"SELECT p.`ProfileId`,p.`FirstName`, p.`LastName`, p.`Cnic`, p.`Email`, p.`Contact`, p.`Qualification`, p.`Specialization`,p.imgsource,c.`ClinicName` 
                                                FROM `cms`.`profile` p 
                                                inner join `timetable` t
                                                on t.`DoctorId`=p.`ProfileId`
                                                INNER JOIN `clinic` c
                                                on c.`ClinicId`=t.`ClinicId`
                                                    where UserType = 2 and p.`IsActive`= 1 and t.ClinicId=" + Request.QueryString["ClinicId"].ToString()+" group by profileid"; 
                    //string query = @"  SELECT `ProfileId`,`FirstName`, `LastName`, `Cnic`, `Email`, `Contact`, `Qualification`, `Specialization`,imgsource FROM `cms`.`profile`
                    //                    where UserType=2 AND ClinicId=" + Request.QueryString["ClinicId"].ToString();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    Repeater1.DataSource = dr;
                    Repeater1.DataBind();
                    con.Close();




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

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text.ToString() != "" && txtSearch.Text.ToString() != null)
                {
                    con.Open();

                    string query = @"SELECT p.`ProfileId`,p.`FirstName`, p.`LastName`, p.`Cnic`, p.`Email`, p.`Contact`, p.`Qualification`, p.`Specialization`,p.imgsource,c.`ClinicName` 
                                                FROM `cms`.`profile` p 
                                                inner join `timetable` t
                                                on t.`DoctorId`=p.`ProfileId`
                                                INNER JOIN `clinic` c
                                                on c.`ClinicId`=t.`ClinicId`
                                                    where UserType = 2 and p.`IsActive`= 1 and t.ClinicId=" + Request.QueryString["ClinicId"].ToString() + "  and  (FirstName like '%" + txtSearch.Text.ToString() + "%' or LastName like '%" + txtSearch.Text.ToString() + "%' " +
                        " or Email like '%" + txtSearch.Text.ToString() + "%' or Qualification like '%" + txtSearch.Text.ToString() + "%' or Specialization like '%" + txtSearch.Text.ToString() + "%') " +
                        " group by profileid";

                    //string query = @"  SELECT `ProfileId`,`FirstName`, `LastName`, `Cnic`, `Email`, `Contact`, `Qualification`, `Specialization`,imgsource
                    //    FROM `cms`.`profile` where UserType=2 AND  ClinicId = " + Request.QueryString["ClinicId"].ToString() + "  and  (FirstName like '%" + txtSearch.Text.ToString() + "%' or LastName like '%" + txtSearch.Text.ToString() + "%' " +
                    //    " or Email like '%" + txtSearch.Text.ToString() + "%' or Qualification like '%" + txtSearch.Text.ToString() + "%' or Specialization like '%" + txtSearch.Text.ToString() + "%') ";
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
        }
    }
}