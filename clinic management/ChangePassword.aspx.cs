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
    public partial class ChangePassword : System.Web.UI.Page
    {

        MySqlConnection con;
        public ChangePassword()
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

        }
       

        protected void btnConfirmpwd_Click(object sender, EventArgs e)
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
                if (txtoldpwd.Text != "")
                {
                    con.Open();
                    string query = "Select * from profile p where p.email='" + user.Email + "' and password='" + txtoldpwd.Text + "' and `IsActive`=1";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        if (txtPassword.Value == txtforgetpwd.Value)
                        {

                            con.Close();
                            con.Open();
                            query = "UPDATE `profile` p SET p.`Password`='" + txtPassword.Value + "' WHERE p.`UserName`='" + user.Email + "'  AND password='" + txtoldpwd.Text + "'";
                            cmd = new MySqlCommand("" + query, con);
                            if (cmd.ExecuteNonQuery() > 0)
                            {
                                lblMsg.Text = "Password has been changed....";
                                if (user.UserType == 1)
                                {
                                    Response.Redirect("Admin/Admincontent.aspx");
                                }
                                else if (user.UserType == 2)
                                {
                                    Response.Redirect("Doctor/doctorwelcome.aspx");
                                }
                                else if (user.UserType == 3 || user.UserType == 5)
                                {

                                    Response.Redirect("PanelReceptionist/receptionistwelcome.aspx");
                                }
                                else if (user.UserType == 4)
                                {

                                    Response.Redirect("Patient/Patientwelcome.aspx");
                                }
                            }
                            else
                            {
                                lblMsg.Text = "Something is missing.....!";
                            }


                        }
                        else
                        {
                            lblMsg.Text = "Confirm passsword must be equal to Password...!";
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Old Password does not Exist, Please try again....!";
                    }
                }
                else
                {
                    lblMsg.Text = "Fields are missing....!";
                }
                
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error to change Password.....!";
            }
            finally
            {
                con.Close();
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
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

                if (user.UserType == 1)
                {
                    Response.Redirect("Admin/Admincontent.aspx");
                }
                else if (user.UserType == 2)
                {
                    Response.Redirect("Doctor/doctorwelcome.aspx");
                }
                else if (user.UserType == 3 || user.UserType == 5)
                {

                    Response.Redirect("PanelReceptionist/receptionistwelcome.aspx");
                }
                else if (user.UserType == 4)
                {
                    Response.Redirect("Patient/Patientwelcome.aspx");
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}