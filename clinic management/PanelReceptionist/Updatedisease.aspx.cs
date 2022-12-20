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
    public partial class Updatedisease : System.Web.UI.Page
    {
        MySqlConnection con;
        public Updatedisease()
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

                string query = "";
                con.Open();
                query = @"select  ct.`ClinicTypeId`,ct.`ClinicType`,
                                  ct.`Description`,ct.`IsActive`,
                                  ct.`createddate`,ct.`createdby`,
                                  ct.`modifiedby`,ct.`modifieddate`,p.`FirstName`,c.`ClinicName`
                                from `cms`.`clinictype` ct
                                inner join `profile` p
                                on p.`ProfileId`=ct.`createdby`
                                inner join `clinic` c
                                on c.`ClinicId`=p.`ClinicId`
                                where p.`ClinicId`=" + user.clinicid;
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                ddlservices.DataSource = dr;
                ddlservices.DataTextField = "ClinicType";
                ddlservices.DataValueField = "ClinicTypeId";
                ddlservices.DataBind();

                con.Close();
                string id = Request.QueryString["id"].ToString();
                con.Open();
                query = @"SELECT 	`diseaseid`, `disease`, `clinicserviceid`, `description`, `isactive`, 
               `createdby`,`createddate`, `modifiedby`, `modifieddate`,clinicserviceid
	            FROM `cms`.`tbldisease`  where diseaseid=" + Request.QueryString["id"].ToString();
                 cmd = new MySqlCommand("" + query, con);
                 dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtDisease.Value = "" + dr["disease"].ToString();
                    string selctedvalue = dr["clinicserviceid"].ToString();
                    ddlservices.Items.FindByValue("" + selctedvalue).Selected=true;
                    txtDecription.Value = "" + dr["description"].ToString();
                    int isactive = Convert.ToInt32(dr["IsActive"].ToString());
                    if (isactive == 1)
                    {
                        chkIsactive.Checked = true;
                    }
                    else
                    {
                        chkIsactive.Checked = false;
                    }
                }


            }

        }

        protected void btnsubmit_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];
                int ischk = 0;
                if (chkIsactive.Checked)
                {
                    ischk = 1;
                }
                if (txtDisease.Value.ToString() != null  && ddlservices.Text.ToString() != "" && txtDecription.Value.ToString() != ""
                    && Request.QueryString["id"].ToString() != null && Request.QueryString["id"].ToString() != ""
                    )
                {
                    string query = @"UPDATE `cms`.`tbldisease`
                                        SET `disease` = '" + txtDisease.Value.ToString()
                                       + "',`clinicserviceid` = " + ddlservices.SelectedValue.ToString()
                                        + ",`description` = '" + txtDecription.Value.ToString()
                                        + "',`IsActive` = " + ischk + ",`modifiedby` = " + user.Id
                                        + " WHERE `diseaseid` = " + Request.QueryString["id"].ToString();
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {

                        con.Close();
                        Response.Redirect("Viewdisease.aspx?clinictype=" + txtDisease.Value);
                        //lblMsg.Text = "Record has been updated....";
                        //lblMsg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = "Error to Update Clinic Service....";
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

                lblMsg.Text = "Error to Insert Clinic type:" + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();

            }
        }
    }
}