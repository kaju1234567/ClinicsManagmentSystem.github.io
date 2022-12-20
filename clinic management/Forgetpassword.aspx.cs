using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management
{
    public partial class Forgetpassword : System.Web.UI.Page
    {

        MySqlConnection con;
        public Forgetpassword()
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
                // email code start

                con.Open();
                string query = "Select * from profile p where p.email='" + txtusername.Text + "' and `IsActive`=1";
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    string password = "";
                    while (dr.Read())
                    {
                        password = dr["Password"].ToString();
                    }

                    var fromAddress = new MailAddress("kajubhutrani@gmail.com", "kajubhutrani@gmail.com");
                    var toAddress = new MailAddress("" + txtusername.Text, "");
                    const string fromPassword = "Kajal123/.";
                    const string subject = "Clinic credentials";
                    string body = "Dear Sir/Madam,\nFollowing are the credential for your clinic on AK Service. AS your: \n Username : " + txtusername.Text + " \nPassword : " + password;

                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                    };
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {

                        smtp.Send(message);
                        lblMsg.Text = "Email has been sent to (" + txtusername.Text + ")";


                        //if (txtPassword.Value == txtforgetpwd.Value)
                        //{
                        //    con.Close();
                        //    con.Open();
                        //    query = "UPDATE `profile` p SET p.`Password`='" + txtPassword.Value + "' WHERE p.`UserName`='" + txtusername.Text + "' ";
                        //    cmd = new MySqlCommand("" + query, con);
                        //    if (cmd.ExecuteNonQuery() > 0)
                        //    {
                        //        smtp.Send(message);
                        //        lblMsg.Text = "Email has been sent to (" + txtusername.Text + ")";
                        //        Response.Write("<Script>alert('Password is updated...!')</Script>");
                        //    }
                        //    else
                        //    {
                        //        lblMsg.Text = "Something is missing.....!";
                        //    }


                        //}
                        //else
                        //{
                        //    lblMsg.Text = "Confirm passsword must be equal to Password...!";
                        //}

                    }
                }
                else
                {
                    lblMsg.Text = "Email does not exist...!";

                }
                // email code End

            }
            catch (Exception ex)
            {

                lblMsg.Text = "Error to send Email on "+txtusername.Text;
            }
            finally
            {
                con.Close();
            }
        }
    }
}