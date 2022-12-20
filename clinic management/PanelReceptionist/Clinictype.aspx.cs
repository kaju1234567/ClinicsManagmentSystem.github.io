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
    public partial class Clinictype : System.Web.UI.Page
    {
        MySqlConnection con;


        public Clinictype()
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
            Userinfo user = null;
            if (Session["Username"] != null)
            {
                user = (Userinfo)Session["Username"];

            }
            else
            {
                Response.Redirect("../Login.aspx");
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
                if (txtClinictype.Value.ToString()!= null && txtClinictype.Value.ToString() != ""
                    && txtDecription.Value.ToString() != null && txtDecription.Value.ToString() != ""
                    )
                {
                    string query = @"INSERT INTO `cms`.`clinictype`
                                        (`ClinicType`,`Description`,`IsActive`,`createdby`)
                                            VALUES ('"+txtClinictype.Value.ToString()+"','"+txtDecription.Value.ToString()+"',"+ischk+","+user.Id+");";
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {

                        con.Close();
                        Response.Redirect("Viewclinicservices.aspx?clinictype="+txtClinictype.Value);
                        //lblMsg.Text = "Record has been updated....";
                        //lblMsg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = "Error to Insert Clinic type....";
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