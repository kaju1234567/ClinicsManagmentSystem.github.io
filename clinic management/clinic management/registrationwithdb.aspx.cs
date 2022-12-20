using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management
{
    public partial class registrationwithdb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DatabaseClass db = new DatabaseClass();
                Label1.Text = db.connect();
            }
            catch (Exception ex)
            {
                Label1.Text = "exception" + ex.Message;
            }
        }
    }
}