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
    public partial class Viewclinicforadmin : System.Web.UI.Page
    {
        MySqlConnection con;
        public Viewclinicforadmin()
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

        void Hidecolumn()
        {
            try
            {
                gridViewClinic.HeaderRow.Cells[2].Visible = false;
                foreach (GridViewRow gvr in gridViewClinic.Rows)
                {
                    gvr.Cells[2].Visible = false;
                    

                }
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
                    Response.Redirect("Login.aspx");
                }
                if (Page.IsPostBack==false)
                {
                    con.Open();
                    string query = @"select c.`ClinicId`,c.`ClinicName`,c.`Contact`,c.`Address`,c.`Latitude`,c.`Longitude`,
                                if(c.`IsActive`=1,'Active','Inactive') 'isactive',c.`createddate`
                                ,p.`FirstName` as 'CreatedBy'
                                from clinic as c
                                inner join `profile` as p
                                on c.`createdby`=p.`ProfileId`";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    gridViewClinic.DataSource = dr;
                    gridViewClinic.DataBind();
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

        protected void btnEditclinic_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string clinicid=gvr.Cells[2].Text.ToString();
                string clinicname= gvr.Cells[3].Text.ToString();
                if (clinicid != null)
                {
                    Response.Redirect("UpdateClinic.aspx?id="+clinicid);
                }


            }
            catch (Exception ex)
            {

            }
        }

        protected void btnDeleteclinic_Click(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];

                if (user!=null)
                {
                    Button btn = (Button)sender as Button;
                    TableCell cell = (TableCell)btn.Parent;
                    GridViewRow gvr = (GridViewRow)cell.Parent;
                    string clinicid = gvr.Cells[2].Text.ToString();
                    string query = @"update clinic set isactive=0 where ClinicId="+clinicid;
                    query = query + "; UPDATE `profile` SET `IsActive`=0 WHERE `ClinicId`=" + clinicid; 
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {
                        Response.Write("<script>alert('Record has been updated')</script>");

                        con.Close();
                        con.Open();
                        query = @"select c.`ClinicId`,c.`ClinicName`,c.`Contact`,c.`Address`,c.`Latitude`,c.`Longitude`,
                                if(c.`IsActive`=1,'Active','Inactive') 'isactive',c.`createddate`
                                ,p.`FirstName` as 'CreatedBy'
                                from clinic as c
                                inner join `profile` as p
                                on c.`createdby`=p.`ProfileId`";
                        cmd = new MySqlCommand("" + query, con);
                        MySqlDataReader dr = cmd.ExecuteReader();
                        gridViewClinic.DataSource = dr;
                        gridViewClinic.DataBind();
                        Hidecolumn();
                    }
                    else
                    {
                        Response.Write("<script>alert('Record has not been updated')</script>");
                    }

                }
                else
                {

                    Response.Redirect("Login.aspx");
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