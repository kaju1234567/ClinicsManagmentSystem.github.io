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
    public partial class ViewDoctorReceptionist : System.Web.UI.Page
    {

        MySqlConnection con;
        public ViewDoctorReceptionist()
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
                    con.Open();
                    string query = @"SELECT p.`ProfileId`,p.`FirstName`,p.`Contact`,p.`Address`, p.`Gender`,p.`Email`, p.`Qualification`, p.`Specialization`,
                                     p.`UserName`,p.`Password`, if(p.`IsActive`=1, 'Active', 'Inactive') 'isactive'
                                    FROM clinic c
                                    INNER JOIN `profile` p
                                    ON c.clinicid = p.clinicid
                                    WHERE p.`UserType`= 2 AND c.`ClinicId`=" + user.clinicid;
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    gridDoctors.DataSource = dr;
                    gridDoctors.DataBind();
                    Hidecolumn();

                }

                //con.Close();



            }
            catch (Exception ex)
            {


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
                gridDoctors.HeaderRow.Cells[4].Visible = false;
                gridDoctors.HeaderRow.Cells[14].Visible = false;
                foreach (GridViewRow gvr in gridDoctors.Rows)
                {
                    gvr.Cells[4].Visible = false;
                    gvr.Cells[14].Visible = false;
                    if (gvr.Cells[14].Text.ToString() == "Active")
                    {
                        Button btn = gvr.FindControl("btnDelete") as Button;
                        btn.Text = "Active";
                    }
                    else
                    {
                        Button btn = gvr.FindControl("btnDelete") as Button;
                        btn.Text = "Inactive";
                    }


                }
            }
            catch (Exception ex)
            {

            }
        }
       
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string profileid = gvr.Cells[4].Text.ToString();
                string firstname = gvr.Cells[5].Text.ToString();
                if (profileid != null)
                {
                    Response.Redirect("updatedoctorreceptonist.aspx?id=" + profileid);
                }


            }
            catch (Exception ex)
            {

            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];

                if (user != null)
                {
                    Button btn = (Button)sender as Button;
                    TableCell cell = (TableCell)btn.Parent;
                    GridViewRow gvr = (GridViewRow)cell.Parent;
                    string profileid = gvr.Cells[4].Text.ToString();
                    string query = @"update profile set isactive=0 where ProfileId=" + profileid;
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {
                        Response.Write("<script>alert('Record has been deleted')</script>");

                        con.Close();
                        con.Open();
                        query = @"SELECT p.`ProfileId`,p.`FirstName`,p.`Contact`,p.`Address`, p.`Gender`,p.`Email`, p.`Qualification`, p.`Specialization`,
                                     p.`UserName`,p.`Password`, if(p.`IsActive`= 1, 'Active', 'Inactive') 'isactive'
                                    FROM clinic c
                                    INNER JOIN `profile` p
                                    ON c.clinicid = p.clinicid
                                    WHERE p.`UserType`= 2 AND c.`ClinicId`=" + user.clinicid;
                        cmd = new MySqlCommand("" + query, con);
                        MySqlDataReader dr = cmd.ExecuteReader();
                        gridDoctors.DataSource = dr;
                        gridDoctors.DataBind();
                        Hidecolumn();
                    }
                    else
                    {
                        Response.Write("<script>alert('Record has not been deleted')</script>");
                    }

                }
                else
                {

                    Response.Redirect("Login.aspx");
                }



            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error Delete: "+ex.Message+"')</script>");
            }
            finally
            {
                con.Close();

            }
        }

        protected void btnTimings_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string profileid = gvr.Cells[4].Text.ToString();
                if (profileid != null)
                {
                    Response.Redirect("Viewdoctortimeforreceptionist.aspx?profileid=" + profileid);
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error Delete: " + ex.Message + "')</script>");
            }
           
        }

        protected void btnServices_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string profileid = gvr.Cells[4].Text.ToString();
                string doctorname = gvr.Cells[5].Text.ToString();
                if (profileid != null)
                {
                    Response.Redirect("Addservicesagainstdoctor.aspx?profileid=" + profileid+ "&doctorname="+ doctorname);
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
    