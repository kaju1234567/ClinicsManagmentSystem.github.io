using clinic_management.Beans;
using clinic_management.dbclasses;
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
    public partial class Adddoctorforreceptionist : System.Web.UI.Page
    {
        Singuporsignin singuporsignin = null;

        MySqlConnection con;
        public Adddoctorforreceptionist()
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
            if (Session["Username"] != null)
            {
                Userinfo user = (Userinfo)Session["Username"];
                //lblusername.Text = user.Username;
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];
                singuporsignin = new Singuporsignin();
                if (txtFirstname.Text.Length > 0
                    && txtLastname.Text.Length > 0 && txtuser.Text.Length > 0
                        && txtAddress.Text.Length > 0 && txtContact.Text.Length > 0
                    && txtuser.Text.Length > 0 && txtPassword.Value.Length > 0
                    && txtCnic.Text.Length > 0 && ddlGender.SelectedItem.Text.Length > 0 && ddlGender.SelectedItem.Text != "-- Select Gender --" && FileUploadDoctorimage.HasFile)
                {

                    con.Open();
                    string query = "Select * from profile p where p.email='" + txtuser.Text + "'";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == false)
                    {

                        string msg = singuporsignin.Signupmethod(txtFirstname.Text + "", txtLastname.Text + "", txtCnic.Text + "", ddlGender.SelectedItem.Text.ToString() + "", txtContact.Text + "",
                        txtuser.Text + "", txtAddress.Text + "", txtuser.Text + "", txtPassword.Value.ToString() + "", txtQualification.Text, txtSpecilaization.Text, user.clinicid, "images//" + FileUploadDoctorimage.FileName);

                        if (msg == "notInserted")
                        {
                            Response.Write("<script>alert('Something is missing....!')</script>");
                        }
                        else if (msg == "Inserted")
                        {
                            FileUploadDoctorimage.SaveAs(Server.MapPath("../images//" + FileUploadDoctorimage.FileName));

                            // email code start

                            var fromAddress = new MailAddress("kajubhutrani@gmail.com", "kajubhutrani@gmail.com");
                            var toAddress = new MailAddress("" + txtuser.Text, "");
                            const string fromPassword = "Kajal123/.";
                            const string subject = "Clinic credentials";
                            string body = "Dear Sir/Madam,\nFollowing are the credential for your clinic on AK Service. \n Username : " + txtuser.Text + " \nPassword : " + txtPassword.Value;
                            body = body + "";
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
                                Response.Redirect("ViewDoctorReceptionist.aspx");//this mean go to another page (Login.aspx)
                            }

                            // email code End
                           
                        }
                        else
                        {
                            Response.Write("<script>alert('" + msg + "')</script>");
                        }
                    }

                    else
                    {
                        Response.Write("<script>alert('Please fill required fields')</script>");

                    }
                }
            }
            catch (Exception ex)

            {
                Response.Write("<script>alert('Error:" + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}