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
    public partial class Addclinicforadmin : System.Web.UI.Page
    {
        Userinfo user;
        ClinicDML clinicDML;
        private string isactive;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                user=(Userinfo)Session["Username"];

                //Response.Write("Patient is  :" + user.Username);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

       

        protected void btnsubmit_ServerClick(object sender, EventArgs e)
        {
            try
            {
                clinicDML = new ClinicDML();
                int isactive = 0;
                user = (Userinfo)Session["Username"];
                if (chkIsactive.Checked)
                {
                    isactive = 1;

                }
                string msg = clinicDML.ADDCLINIC(txtclinicname.Value, txtc.Text, txtAddress.Value, txtLat.Value, txtLong.Value, isactive, user.Id,txtemail.Value,txtPassword.Value);
                if (msg == "Inserted")
                {
                    lblMsg.Text = "Clinic has been Inserted...";
                   
                }

                else
                {
                    lblMsg.Text = ""+msg;
                }
                
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error in Adding:" + ex.Message;
            }
            // Response.Redirect("Addclinicforadmin.aspx");
            ClearFields();
        }

        void ClearFields()
        {
            try
            {
                //GridviewDmo.id = 0;
                txtclinicname.Value = "";
                txtc.Text = "";
                txtAddress.Value = "";
                txtLat.Value = "";
                txtLong.Value = "";
                chkIsactive.Checked = false;

            }
            catch (Exception ex)
            {

            }
        }

    }
}