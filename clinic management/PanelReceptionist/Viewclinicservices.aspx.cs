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
    public partial class Viewclinicservices : System.Web.UI.Page
    {

        MySqlConnection con;


        public Viewclinicservices()
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
                    Response.Redirect("../Login.aspx");
                }
                if (Page.IsPostBack == false)
                {
                    con.Open();
                    string query = @"SELECT  ct.`ClinicTypeId`,ct.`ClinicType`,
                              ct.`Description`,if(ct.`IsActive`=1,'Active','Inactive') as 'Isactive',
                              p.`FirstName` as 'Createdby',c.`ClinicName` 'Clinic' 
                            FROM `cms`.`clinictype` ct
                            INNER JOIN `profile` p
                            ON p.`ProfileId`=ct.`createdby`
                            INNER JOIN `clinic` c
                            ON c.`ClinicId`=p.`ClinicId`
                            WHERE p.`ClinicId`=" + user.clinicid;
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {

            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string clinicid = gvr.Cells[2].Text.ToString();
                string clinicname = gvr.Cells[3].Text.ToString();
                if (clinicid != null)
                {
                    Response.Redirect("Updateclinictype.aspx?id=" + clinicid);
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
                    string ClinicTypeId = gvr.Cells[2].Text.ToString();
                    string query = @"update clinictype set IsActive=0 where ClinicTypeId=" + ClinicTypeId;
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {
                        Response.Write("<script>alert('Record has been Deleted')</script>");

                        con.Close();
                        con.Open();
                        query = @"SELECT  ct.`ClinicTypeId`,ct.`ClinicType`,
                              ct.`Description`,if(ct.`IsActive`=1,'Active','Inactive') as 'Isactive',
                              p.`FirstName` as 'Createdby',c.`ClinicName` 'Clinic' 
                            FROM `cms`.`clinictype` ct
                            INNER JOIN `profile` p
                            ON p.`ProfileId`=ct.`createdby`
                            INNER JOIN `clinic` c
                            ON c.`ClinicId`=p.`ClinicId`
                            WHERE p.`ClinicId`=" + user.clinicid;
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