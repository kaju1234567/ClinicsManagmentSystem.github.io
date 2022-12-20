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
    public partial class Viewdisease : System.Web.UI.Page
    {

        MySqlConnection con;


        public Viewdisease()
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
                gridViewClinic.HeaderRow.Cells[3].Visible = false;
                foreach (GridViewRow gvr in gridViewClinic.Rows)
                {
                    gvr.Cells[3].Visible = false;


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
                    string query = @"SELECT d.`diseaseid`,d.`disease`,cs.`ClinicType` as 'Service',d.`description`,
                                        if(d.`isactive`=1,'Active','Inactive') as 'Isactive',p.`FirstName` as 'createdby',d.`createddate`
                                        FROM `cms`.`tbldisease` d
                                        INNER JOIN  `clinictype` cs
                                        ON d.`clinicserviceid`=cs.`ClinicTypeId`
                                        INNER JOIN `profile` p
                                        ON p.`ProfileId`=d.`createdby`
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
                string diseaseid = gvr.Cells[3].Text.ToString();
                string clinicname = gvr.Cells[3].Text.ToString();
                if (diseaseid != null)
                {
                    Response.Redirect("Updatedisease.aspx?id=" + diseaseid+ "&clinicname="+ clinicname);
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
                    string diseaseid = gvr.Cells[3].Text.ToString();
                    string query = @"update tbldisease set isactive=0 where diseaseid=" + diseaseid;
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {
                        Response.Write("<script>alert('Record has been Deleted')</script>");

                        con.Close();
                        con.Open();
                        query = @"SELECT d.`diseaseid`,d.`disease`,cs.`ClinicType` as 'Service',d.`description`,
                                    if(d.`isactive`=1,'Active','Inactive') as 'Isactive',p.`FirstName` as 'createdby',d.`createddate`
                                    FROM `cms`.`tbldisease` d
                                    INNER JOIN  `clinictype` cs
                                    ON d.`clinicserviceid`=cs.`ClinicTypeId`
                                    INNER JOIN `profile` p
                                    ON p.`ProfileId`=d.`createdby`
                                    WHERE p.`ClinicId`=" + user.clinicid;
                        cmd = new MySqlCommand("" + query, con);
                        MySqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            gridViewClinic.DataSource = dr;
                            gridViewClinic.DataBind();
                            Hidecolumn();
                        }
                        
                    }
                    else
                    {
                        Response.Write("<script>alert('Record has not been deleted')</script>");
                    }

                }
                else
                {

                    Response.Redirect("../Login.aspx");
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

       

        protected void btnSymptoms_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string diseaseid = gvr.Cells[3].Text.ToString();
                if (diseaseid != null && diseaseid != "")
                {
                    Response.Redirect("Addsymptomforreceptionist.aspx?diseaseid=" + diseaseid);

                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error in Symptoms : " + ex.Message.ToString() + "')</script>");

            }
        }
    }
}