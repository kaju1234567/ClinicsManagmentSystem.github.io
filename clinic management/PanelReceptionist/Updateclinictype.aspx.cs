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
    public partial class Updateclinictype : System.Web.UI.Page
    {
        MySqlConnection con;
        public Updateclinictype()
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
                string id = Request.QueryString["id"].ToString();
                con.Open();
                string query = @"SELECT `ClinicTypeId`,`ClinicType`,
                                      `Description`,`IsActive`,
                                      `createddate`,`createdby`,
                                      `modifiedby`,`modifieddate`
                                    FROM `cms`.`clinictype` where ClinicTypeId=" + Request.QueryString["id"].ToString();
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtClinictype.Value = "" + dr["ClinicType"].ToString();
                    txtDecription.Value = "" + dr["Description"].ToString();
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
                if (txtClinictype.Value.ToString() != null && txtClinictype.Value.ToString() != ""
                    && txtDecription.Value.ToString() != null && txtDecription.Value.ToString() != ""
                    && Request.QueryString["id"].ToString()!=null && Request.QueryString["id"].ToString()!=""
                    )
                {
                    string query = @"UPDATE `cms`.`clinictype`
                                        SET `ClinicType` = '"+txtClinictype.Value.ToString()
                                        +"',`Description` = '"+txtDecription.Value.ToString()
                                        +"',`IsActive` = "+ischk+",`modifiedby` = "+user.Id
                                        +" WHERE `ClinicTypeId` = "+Request.QueryString["id"].ToString();
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {

                        con.Close();
                        Response.Redirect("Viewclinicservices.aspx?clinictype=" + txtClinictype.Value);
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