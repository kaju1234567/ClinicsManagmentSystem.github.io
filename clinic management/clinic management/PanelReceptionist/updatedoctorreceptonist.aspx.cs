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
    public partial class updatedoctorreceptonist : System.Web.UI.Page
    {
        MySqlConnection con;
        public updatedoctorreceptonist()
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
                    string query = @"select p.`ProfileId`, p.`FirstName`, p.`LastName`, p.`Cnic`,  
                    p.`Contact`, p.`Email`, p.`Address`,  
                    p.`CreateDate`, p.`Qualification`, p.`Specialization`, 
                    p.`IsActive`
                    from `cms`.`profile` as p 
                    where ProfileId=" + id;
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        txtFirstname.Value = "" + dr["FirstName"].ToString();
                        txtLastname.Value = "" + dr["LastName"].ToString();
                        txtcnic.Value = "" + dr["Cnic"].ToString();
                        txtContact.Value = "" + dr["Contact"].ToString();
                        txtEmail.Value = "" + dr["Email"].ToString();
                        txtAddress.Value = "" + dr["Address"].ToString();
                        txtqualification.Value = "" + dr["Qualification"].ToString();
                        txtspecialization.Value = "" + dr["Specialization"].ToString();
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

                if (txtFirstname.Value.ToString() != null && txtLastname.Value.ToString() != ""
                    && txtcnic.Value.ToString() != null && txtContact.Value.ToString() != ""
                    && txtEmail.Value.ToString() != null && txtAddress.Value.ToString() != null && txtqualification.Value.ToString() != "" && txtspecialization.Value.ToString() != ""
                    )
                {
                    int ischk = 0;
                    if (chkIsactive.Checked)
                    {
                        ischk = 1;
                    }
                    string query = @"update `cms`.`profile`
                                    set `FirstName` = '" + txtFirstname.Value + "', `LastName` = '" + txtLastname.Value + "', Cnic = '" + txtcnic.Value + "', `Contact` = '" + txtContact.Value.ToString() + "', `Email` = '" + txtEmail.Value.ToString() + "', `Address` = '" + txtAddress.Value.ToString()
                                    + "',`Qualification` = '" + txtqualification.Value.ToString() + "',`Specialization` = '" + txtspecialization.Value.ToString()
                                    + "',`IsActive` = " + ischk + "  where `ProfileId` = " + id;
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {

                        con.Close();
                        Response.Redirect("ViewDoctorReceptionist.aspx");
                        //lblMsg.Text = "Record has been updated....";
                        //lblMsg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = "Error to update ViewDoctorReceptionist....";
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

                lblMsg.Text = "Error to update ViewDoctorReceptionist:" + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();

            }

        }
    }
}

