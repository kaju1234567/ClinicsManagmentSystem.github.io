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
    public partial class UpdateClinic : System.Web.UI.Page
    {
        MySqlConnection con;
        public UpdateClinic()
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
                    Response.Redirect("Login.aspx");
                }
                if (Page.IsPostBack == false)
                {
                    string id = Request.QueryString["id"].ToString();
                    con.Open();
                    string query = @"select c.`ClinicId`,c.`ClinicName`,c.`Contact`,c.`Address`,c.`Latitude`,c.`Longitude`,c.`IsActive`,c.`createddate`
                                from clinic as c
                                where c.`ClinicId`=" + id;
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        txtclinicname.Value = "" + dr["ClinicName"].ToString();
                        txtc.Text = "" + dr["Contact"].ToString();
                        txtAddress.Value = "" + dr["Address"].ToString();
                        txtLat.Value = "" + dr["Latitude"].ToString();
                        txtLong.Value = "" + dr["Longitude"].ToString();
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
            catch (Exception ex)
            {


            }
            finally
            {
                con.Close();
            }

        }

        protected void btnupdateclinic_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];
                string id = Request.QueryString["id"].ToString();

                if (txtclinicname.Value.ToString() != null && txtclinicname.Value.ToString() != ""
                    && txtc.Text.ToString() != null && txtc.Text.ToString() != ""
                    )
                {
                    int ischk = 0;
                    if (chkIsactive.Checked)
                    {
                        ischk = 1;
                    }
                    string query = @"update `cms`.`clinic`
                                    set `ClinicName` = '" + txtclinicname.Value + "',`Contact` = '" + txtc.Text.ToString() + "',`Address` = '" + txtAddress.Value.ToString()
                                    + "',`Latitude` = '" + txtLat.Value.ToString() + "',`Longitude` = '" + txtLong.Value.ToString()
                                    + "',`IsActive` = " + ischk + ",`updatedby` = " + user.Id + " where `ClinicId` = " + id;

                    if (chkIsactive.Checked)
                    {
                        query = query + "; UPDATE `profile` SET `IsActive`=1 WHERE `ClinicId`=" + id;
                    }
                   
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {

                        con.Close();
                        Response.Redirect("Viewclinicforadmin.aspx");
                        //lblMsg.Text = "Record has been updated....";
                        //lblMsg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = "Error to update Viewclinicforadmin....";
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

                lblMsg.Text = "Error to update Viewclinicforadmin:" + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();

            }

        }
    }
}
