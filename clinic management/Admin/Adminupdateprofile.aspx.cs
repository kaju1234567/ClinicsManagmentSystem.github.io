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
    public partial class Adminupdateprofile : System.Web.UI.Page
    {
        MySqlConnection con;
       

        public Adminupdateprofile()
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


                    string query = @"select ProfileId,FirstName,LastName,Cnic,Gender,Contact,Email,Address,
                                  UserName,Password,UserType,CreateDate,Qualification,Specialization,IsActive,ClinicId
                                from cms.profile where ProfileId=" + user.Id;
                    con.Open();
                    user = (Userinfo)Session["Username"];
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                
                    while (dr.Read())
                    {

                        firstname.Value = dr["FirstName"].ToString();

                        txtlastname.Value = dr["LastName"].ToString();

                        txtcnic.Value = dr["Cnic"].ToString();
                        txtemail.Value = dr["Email"].ToString();
                        txtContact.Value= dr["Contact"].ToString();
                        txtAddress.Value = dr["Address"].ToString();

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

        protected void btnClick_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];

                if (firstname.Value.ToString() != null && txtlastname.Value.ToString() != ""
                    && txtcnic.Value.ToString() != null && txtContact.Value.ToString() != ""
                    && txtemail.Value.ToString() != null && txtAddress.Value.ToString() != ""
                    )
                {
                    string query = @"UPDATE `cms`.`profile`
                            SET `FirstName` = '"+firstname.Value.ToString()+"',`LastName` = '"+txtlastname.Value.ToString()
                            +"',`Cnic` = '"+txtcnic.Value.ToString()+"',`Contact` = '"+ txtContact.Value.ToString() + "',`Email` = '"+ txtemail.Value.ToString() 
                            + "',`Address` = '"+txtAddress.Value.ToString()+"' WHERE `ProfileId` =  " + user.Id;
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {

                        con.Close();
                        Response.Redirect("Admincontent.aspx");
                        //lblMsg.Text = "Record has been updated....";
                        //lblMsg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = "Error to update....";
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

                lblMsg.Text = "Error to update:" + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();

            }
        }
       
    }
}