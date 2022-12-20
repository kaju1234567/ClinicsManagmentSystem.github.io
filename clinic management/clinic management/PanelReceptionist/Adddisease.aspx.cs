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
    public partial class Adddisease : System.Web.UI.Page
    {
        MySqlConnection con;
        public Adddisease()
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

        public void Fillddl()
        {
            try
            {

                Userinfo user = (Userinfo)Session["Username"];
                if (Page.IsPostBack == false)
                {

                    con.Open();
                    string query = @"select  ct.`ClinicTypeId`,ct.`ClinicType`,
                                  ct.`Description`,ct.`IsActive`,
                                  ct.`createddate`,ct.`createdby`,
                                  ct.`modifiedby`,ct.`modifieddate`,p.`FirstName`,c.`ClinicName`
                                from `cms`.`clinictype` ct
                                inner join `profile` p
                                on p.`ProfileId`=ct.`createdby`
                                inner join `clinic` c
                                on c.`ClinicId`=p.`ClinicId`
                                where p.`ClinicId`= " + user.clinicid;
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    ddlservices.DataSource = dr;
                    ddlservices.DataTextField = "ClinicType";
                    ddlservices.DataValueField = "ClinicTypeId";
                    ddlservices.DataBind();



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
                Fillddl();



            }
            catch (Exception ex)
            {

            }
        }

        protected void btnsubmit_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];
                if (txtDisease.Value.ToString() != null && txtDisease.Value.ToString() != ""
                    && txtDecription.Value.ToString() != null && txtDecription.Value.ToString() != ""
                    && ddlservices.SelectedItem.Text!="")
                {
                    int ischk = 0;
                    if (chkIsactive.Checked)
                    {
                        ischk = 1;
                    }
                    string query = @"INSERT INTO `cms`.`tbldisease`(`disease`,`clinicserviceid`,`description`,`isactive`,
                                                 `createdby`,`modifiedby`)
                                    VALUES ('"+txtDisease.Value.ToString()+"',"+ddlservices.SelectedItem.Value.ToString()+",'"+txtDecription.Value.ToString()+"',"+ischk+","+user.Id+","+user.Id+");";
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {

                        con.Close();
                        Response.Redirect("Viewdisease.aspx?disease="+txtDisease.Value.ToString());
                        //lblMsg.Text = "Record has been updated....";
                        //lblMsg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = "Error to Insert Viewdisease....";
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                    }

                }
                else
                {

                    lblMsg.Text = "Fill required fields....";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }



            }
            catch (Exception ex)
            {

                lblMsg.Text = "Error to Insert Viewdisease:" + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();

            }

        }
    }
}