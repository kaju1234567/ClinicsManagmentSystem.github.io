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
    public partial class Viewclinicforpatient : System.Web.UI.Page
    {
        MySqlConnection con;
        public Viewclinicforpatient()
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
                    string query = @"  SELECT  c.`ClinicId`, c.`ClinicName`, c.`Contact`, c.`Address`
                                        FROM clinic c
                                        inner join `profile` p
                                        on c.`ClinicId`=p.`ClinicId`
                                        INNER JOIN `timetable` t
                                        ON t.`DoctorId`=p.`ProfileId`
                                        where c.isactive=1 AND p.`IsActive`=1 AND p.`UserType`=2
                                        GROUP BY c.`ClinicId` limit 0,10";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr2 = cmd.ExecuteReader();
                    Repeater2.DataSource = dr2;
                    Repeater2.DataBind();
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

                    //clinic details
                    con.Open();
                    string query = @" SELECT  c.`ClinicId`, c.`ClinicName`, c.`Contact`, c.`Address`,s.`symptom`
                                        FROM clinic c
                                        inner join `profile` p
                                        on c.`ClinicId`=p.`ClinicId`
                                        INNER JOIN `timetable` t
                                        ON t.`DoctorId`=p.`ProfileId`
                                        LEFT JOIN  `doctorservices` ds
                                        ON p.`ProfileId`=ds.`doctorid`
                                        LEFT JOIN `clinictype` dt
                                        ON ds.`clinictypeid`=dt.`ClinicTypeId` AND ds.`isactive`=1
                                        LEFT JOIN `tbldisease` d 
                                        ON ds.`clinictypeid`=d.`clinicserviceid`
                                        LEFT JOIN `symptoms` s 
                                        ON d.`diseaseid`=s.`diseaseid`
                                        where c.`IsActive`=1 AND 
                                            (c.`ClinicName` LIKE '%" + txtSearch.Text.ToString() 
                                            + "%'   OR  c.`Contact` LIKE '%" + txtSearch.Text.ToString() + "%'   OR  c.`Address` LIKE '%" + txtSearch.Text.ToString() 
                                            + "%' OR s.`symptom` LIKE '%" + txtSearch.Text.ToString() + "%'  OR d.`disease` LIKE '%" + txtSearch.Text.ToString() + "%' OR dt.`ClinicType` LIKE  '%" + txtSearch.Text.ToString() + "%' OR p.FirstName LIKE '%" + txtSearch.Text.ToString()
                                        + "%' OR p.LastName LIKE '%" + txtSearch.Text.ToString() + "%' " +
                                        " OR p.Email LIKE '%" + txtSearch.Text.ToString()
                                        + "%' OR p.Qualification LIKE '%" + txtSearch.Text.ToString()
                                        + "%' OR p.Specialization LIKE '%" + txtSearch.Text.ToString() + "%')   " +
                                        " GROUP BY c.`ClinicId` ";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr2 = cmd.ExecuteReader();
                    Repeater2.DataSource = dr2;
                    Repeater2.DataBind();
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