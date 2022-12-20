using clinic_management.Beans;
using clinic_management.dbclasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management
{
    public partial class Login : System.Web.UI.Page
    {
        Singuporsignin singuporsignin;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                singuporsignin = new Singuporsignin();
                if (txtusername.Text.Length > 0 && txtPassword.Value.Length > 0)
                {

                    Userinfo userinfo=singuporsignin.Loginverify(txtusername.Text.ToString() ,txtPassword.Value.ToString());

                    if (userinfo != null && userinfo.Username!=null && userinfo.Username.Length > 0)
                    {

                        Session["Username"] = userinfo;
                        if (userinfo.UserType == 1)
                        {
                            Response.Redirect("Admin/Admincontent.aspx");
                        }
                        else if (userinfo.UserType == 2)
                        {
                            Response.Redirect("Doctor/doctorwelcome.aspx");
                        }
                        else if (userinfo.UserType == 3 || userinfo.UserType == 5)
                        {
                            
                            Response.Redirect("PanelReceptionist/receptionistwelcome.aspx");
                        }
                        else if (userinfo.UserType == 4)
                        {

                            Response.Redirect("Patient/Patientwelcome.aspx");
                        }

                        else
                        {

                            lblMsg.Text = "Invalid username or Password.....!";
                        }

                    }

                    else
                    {

                        lblMsg.Text = "Invalid username or Password.....!";
                    }
                }
                else

                {
                    lblMsg.Text= "Please fill required fields.....!";
                   
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}