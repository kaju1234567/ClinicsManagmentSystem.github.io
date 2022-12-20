using clinic_management.Beans;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management.PanelReceptionist
{
    public partial class Viewreceptionist : System.Web.UI.Page
    {

        MySqlConnection con;
        public Viewreceptionist()
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
                    string query = @"SELECT p.`ProfileId`,p.`FirstName`, p.`LastName`,p.`Contact`,p.`Address`, p.`Gender`,p.`Email`, p.`Qualification`, p.`Specialization`,
                                     if(p.`IsActive`=1, 'Active', 'Inactive') 'isactive'
                                    FROM clinic c
                                    INNER JOIN `profile` p
                                    ON c.clinicid = p.clinicid
                                    WHERE p.`UserType`= 3 AND c.`ClinicId`=" + user.clinicid;
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    GridReceptionist.DataSource = dr;
                    GridReceptionist.DataBind();
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
                GridReceptionist.HeaderRow.Cells[2].Visible = false;
                foreach (GridViewRow gvr in GridReceptionist.Rows)
                {
                    gvr.Cells[2].Visible = false;


                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnEdit(object sender, EventArgs e)
        {

            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string profileid = gvr.Cells[2].Text.ToString();
                string firstname = gvr.Cells[3].Text.ToString();
                if (profileid != null)
                {
                    Response.Redirect("./Updatereceptionist.aspx?id=" + profileid);
                }


            }
            catch (Exception ex)
            {

            }
        }
    

        protected void btnDelete(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];

                if (user != null)
                {
                    Button btn = (Button)sender as Button;
                    TableCell cell = (TableCell)btn.Parent;
                    GridViewRow gvr = (GridViewRow)cell.Parent;
                    string profileid = gvr.Cells[2].Text.ToString();
                    string query = @"update profile set isactive=0 where ProfileId=" + profileid;
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {
                        Response.Write("<script>alert('Record has been deleted')</script>");

                        con.Close();
                        con.Open();
                        query = @"SELECT p.`ProfileId`,p.`FirstName`, p.`LastName`, p.`Contact`,p.`Address`, p.`Gender`,p.`Email`, p.`Qualification`, p.`Specialization`,
                                     p.`UserName`,p.`Password`, if(p.`IsActive`= 1, 'Active', 'Inactive') 'isactive'
                                    FROM clinic c
                                    INNER JOIN `profile` p
                                    ON c.clinicid = p.clinicid
                                    WHERE p.`UserType`= 3 AND c.`ClinicId`=" + user.clinicid;
                        cmd = new MySqlCommand("" + query, con);
                        MySqlDataReader dr = cmd.ExecuteReader();
                        GridReceptionist.DataSource = dr;
                        GridReceptionist.DataBind();
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

                Response.Write("<script>alert('Error Delete: " + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();

            }
        }
    }
}
