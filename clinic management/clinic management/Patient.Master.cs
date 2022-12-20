using clinic_management.Beans;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management
{
    public partial class Patient : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Userinfo user = (Userinfo)Session["Username"];
                lblusername.Text = user.Username;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}