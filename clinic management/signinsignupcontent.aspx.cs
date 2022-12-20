using clinic_management.dbclasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management
{
    public partial class signinsignupcontent : System.Web.UI.Page
    {
        Singuporsignin singuporsignin;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {


            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                singuporsignin = new Singuporsignin();
                if (txtFirstname.Text.Length > 0
                    && txtLastname.Text.Length > 0 && txtuser.Text.Length > 0
                        && txtAddress.Text.Length > 0 && txtContact.Text.Length > 0
                    && txtuser.Text.Length > 0 && txtPassword.Value.Length > 0
                    && txtCnic.Text.Length > 0 && ddlGender.SelectedItem.Text.Length > 0 && ddlGender.SelectedItem.Text!= "-- Select Gender --")
                {
                    string msg = singuporsignin.Signupmethod(txtFirstname.Text + "", txtLastname.Text + "", txtCnic.Text + "", ddlGender.SelectedItem.Text.ToString() + "", txtContact.Text + "",
                        txtuser.Text + "", txtAddress.Text + "", txtuser.Text + "", txtPassword.Value.ToString() + "");

                    //string msg = singuporsignin.Signupmethod(txtFirstname.Text + "", txtLastname.Text + "", txtCnic.Text + "", ddlGender.SelectedItem.Text.ToString() + "", txtContact.Text + "",
                    //    "zain.tahiri940@gmail.com" + "", txtAddress.Text + "", "zain.tahiri940@gmail.com" + "", txtPassword.Value.ToString() + "");

                    //
                    if (msg == "notInserted")
                    {
                        Response.Write("<script>alert('Something is missing....!')</script>");
                    }
                    else if (msg == "Inserted")
                    {
                        Response.Redirect("Login.aspx");//this mean go to another page (Login.aspx)
                    }
                    else
                    {
                        Response.Write("<script>alert('"+msg+"')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please fill required fields')</script>");

                }
            }
            catch (Exception ex)

            {
                Response.Write("<script>alert('Error:"+ex.Message+"')</script>");
            }
        }
    }
}