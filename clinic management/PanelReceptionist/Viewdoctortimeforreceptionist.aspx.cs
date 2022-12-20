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
    public partial class Viewdoctortimeforreceptionist : System.Web.UI.Page
    {
        MySqlConnection con;
        public Viewdoctortimeforreceptionist()
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

                    Viewdoctortimings();
                }


            }
            catch (Exception ex)
            {
                Response.Write("<Script>alert('Error in to view doctor timeings on load : " + ex.Message + "')</Script>");

            }

            finally
            {
                con.Close();
            }

           
            
        }

        public void Viewdoctortimings()
        {
            try
            {
                //doctor profile details
                string profileid = Request.QueryString["profileid"].ToString();
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                con = new MySqlConnection("" + constr);
                con.Close();
                con.Open();
                string query = @" SELECT tt.`TimeTableId`,p.`ProfileId`,p.`FirstName`,p.`Specialization`,p.`Qualification`,concat(ft.`time`,'-',tot.`time`) as 'Time',tt.`day`,c.`ClinicName`,
                                    if(tt.`IsActive`= 1, 'Active', 'Inactive') 'isactive'
                                    FROM `timetable` tt
                                    INNER JOIN `time` ft
                                    ON tt.`FromTime`=ft.`timeid`
                                    INNER JOIN `time` tot
                                    ON tt.`ToTime`=tot.`timeid`
                                    INNER JOIN `profile` p
                                    ON tt.`DoctorId`=p.`ProfileId`
                                    INNER JOIN `clinic` c
                                    ON tt.`ClinicId`=c.`ClinicId`
                                    WHERE p.`ProfileId`=" + profileid + "  and  p.UserType=2 limit 0,10";
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    gridDoctortimings.DataSource = dr;
                    gridDoctortimings.DataBind();
                    Hidecolumn();

                }
                else
                {
                    Response.Redirect("Adddoctortimetable.aspx");
                }

            }
            catch (Exception ex)
            {

                Response.Write("<Script>alert('Error in to view doctor timeings : "+ex.Message+"')</Script>");
            }

            finally
            {
                con.Close();
            }



        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string TimeTableId = gvr.Cells[2].Text.ToString();
                string ProfileId = gvr.Cells[3].Text.ToString();
                if (TimeTableId != null)
                {
                    Response.Redirect("UpdateDoctorTimeTable.aspx?TimeTableId=" + TimeTableId+ "&ProfileId="+ ProfileId);
                }


            }
            catch (Exception ex)
            {

            }
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string TimeTableId = gvr.Cells[2].Text.ToString();
                string ProfileId = gvr.Cells[3].Text.ToString();
                if (TimeTableId != null)
                {
                    con.Open();
                    string query = @"update `cms`.`timetable` set  `ModifiedDate` = 'now()',`IsActive` = 0 where `TimeTableId` = " + TimeTableId;
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<Script>alert('Record deleted.....')</Script>");
                        Viewdoctortimings();
                    }
                }
            }
            catch (Exception ex)
            {
                con.Close();
                Response.Write("<Script>alert('Error to delete...!')</Script>");
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
                gridDoctortimings.HeaderRow.Cells[2].Visible = false;
                gridDoctortimings.HeaderRow.Cells[3].Visible = false;
                foreach (GridViewRow gvr in gridDoctortimings.Rows)
                {
                    gvr.Cells[2].Visible = false;
                    gvr.Cells[3].Visible = false;


                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
 