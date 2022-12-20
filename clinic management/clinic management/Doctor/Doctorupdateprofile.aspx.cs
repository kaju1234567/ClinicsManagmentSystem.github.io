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
    public partial class Doctorupdateprofile : System.Web.UI.Page
    {
        MySqlConnection con;
        public Doctorupdateprofile()
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

                        lastname.Value = dr["LastName"].ToString();

                        cnic.Value = dr["Cnic"].ToString();
                        email.Value = dr["Email"].ToString();
                        contact.Value = dr["Contact"].ToString();
                        qualification.Value = dr["Qualification"].ToString();
                        specialization.Value = dr["Specialization"].ToString();
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

                if (firstname.Value.ToString() != null && lastname.Value.ToString() != ""
                    && cnic.Value.ToString() != null && contact.Value.ToString() != ""
                    && email.Value.ToString() != null  && qualification.Value.ToString() != null && specialization.Value.ToString() != ""
                    )
                {
                    string query = @"UPDATE `cms`.`profile`
                            SET `FirstName` = '" + firstname.Value.ToString() + "',`LastName` = '" + lastname.Value.ToString()
                            + "',`Cnic` = '" + cnic.Value.ToString() + "',`Contact` = '" + contact.Value.ToString() + "',`Email` = '" + email.Value.ToString()
                             + "' WHERE `ProfileId` =  " + user.Id;
                    con.Open();

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {

                        con.Close();
                        Response.Redirect("doctorwelcome.aspx");
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