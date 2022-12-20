using clinic_management.Beans;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace clinic_management.dbclasses
{
    public class Singuporsignin
    {

        MySqlConnection con;
        public Singuporsignin()
        {
            try
            {

                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                con = new MySqlConnection();
                con.ConnectionString = "" + constr;
                


            }
            catch (Exception ex)
            {

            }

        }

        public string Signupmethod(string FirstName, string LastName,string Cnic, string Gender, string Contact, string Email,string Address, string UserName,string  Password)
        {
            string msg = "notInserted";
            try
            {
                con.Open();
                string query = "Select * from profile p where p.email='" + Email + "'";
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == false)
                {
                    con.Close();
                    con.Open();
                    query = @"insert into `cms`.`profile`(`FirstName`,`LastName`,
                                 `Cnic`,`Gender`,`Contact`,`Email`,
                                 `Address`,`UserName`,`Password`,`UserType`,`IsActive`)
                                    values('" + FirstName + "', '" + LastName + "', '" + Cnic + "', '" + Gender + "', '" + Contact + "', '" + Email + "', '" + Address
                                        + "','" + UserName + "', '" + Password + "', 4, 1); ";

                    cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        // email code start

                        var fromAddress = new MailAddress("kajubhutrani@gmail.com", "kajubhutrani@gmail.com");
                        var toAddress = new MailAddress("" + Email, "");
                        const string fromPassword = "Kajal123/.";
                        const string subject = "Clinic credentials";
                        string body = "Dear Sir/Madam,\nFollowing are the credential for your clinic on AK Service. \n Username : " + Email + " \nPassword : " + Password;

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
                        }

                        // email code End
                        msg = "Inserted";

                    }
                    else
                    {
                        msg = "notInserted";
                    }
                }
                else
                {

                    msg = Email + " Already Exist....!";
                }

          
            }
            catch (Exception ex)
            {

                msg = "Error in Signup:" + ex.Message;
            }
            finally
            {
                con.Close();
            }
            return msg;

        }

        //internal string Signupmethod(string v1, string v2, string v3, string v4, string v5, string v6, string v7, string v8, string v9)
        //{
        //    throw new NotImplementedException();
        //}

        public string Signupmethod(string FirstName, string LastName, string Cnic, string Gender, string Contact, string Email, string Address, string UserName, string Password,
            string qualification,string specialization,int clinicid, string imgsource)
        {
            string msg = "notInserted";
            try
            {
                con.Open();
                string query = @"insert into `cms`.`profile`
                                (`FirstName`,`LastName`,`Cnic`,`Gender`,
                                 `Contact`,`Email`,`Address`,`UserName`,
                                 `Password`,`UserType`,`IsActive`,`Qualification`,
                                 `Specialization`,`ClinicId`,imgsource)
                                    values('" + FirstName + "', '" + LastName + "', '" + Cnic + "', '" + Gender + "', '" + Contact + "', '" + Email + "', '" + Address
                                    + "','" + Email + "', '" + Password + "', 2, 1,'"+qualification+"','"+specialization+"',"+clinicid+ ",'" +imgsource+"'); ";

                MySqlCommand cmd = new MySqlCommand("" + query, con);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    msg = "Inserted";

                }
                else
                {

                    msg = "notInserted";
                }


            }
            catch (Exception ex)
            {

                msg = "Error in Signup:" + ex.Message;
            }
            finally
            {
                con.Close();
            }
            return msg;

        }
        public string Signupmethod(string FirstName, string LastName, string Cnic, string Gender, string Contact, string Email, string Address, string UserName, string Password,
            string qualification, string specialization, int clinicid, string imgsource,string usertype)
        {
            string msg = "notInserted";
            try
            {
                con.Open();
                string query = @"insert into `cms`.`profile`
                                (`FirstName`,`LastName`,`Cnic`,`Gender`,
                                 `Contact`,`Email`,`Address`,`UserName`,
                                 `Password`,`UserType`,`IsActive`,`Qualification`,
                                 `Specialization`,`ClinicId`,imgsource)
                                    values('" + FirstName + "', '" + LastName + "', '" + Cnic + "', '" + Gender + "', '" + Contact + "', '" + Email + "', '" + Address
                                    + "','" + Email + "', '" + Password + "',  3, 1,'" + qualification + "','" + specialization + "'," + clinicid + ",'" + imgsource + "'); ";

                MySqlCommand cmd = new MySqlCommand("" + query, con);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    msg = "Inserted";

                }
                else
                {

                    msg = "notInserted";
                }


            }
            catch (Exception ex)
            {

                msg = "Error in Signup:" + ex.Message;
            }
            finally
            {
                con.Close();
            }
            return msg;

        }
        //internal string Signupmethod(string v1, string v2, string v3, string v4, string v5, string v6, string v7, string v8, string v9, string text1, string text2)
        //{
        //    throw new NotImplementedException();
        //}

        //internal string Signupmethod(string v1, string v2, string v3, string v4, string v5, string v6, string v7, string v8, string v9, string text1, string text2, int clinicid)
        //{
        //    throw new NotImplementedException();
        //}

        public Userinfo Loginverify(string username,string pwd)
        {
            Userinfo userinfo = new Userinfo();
            try
            {
                
                    con.Open();
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM `profile` f WHERE f.`UserName`='" + username + "' AND f.`Password`='" + pwd + "' AND f.IsActive=1 ", con);
                MySqlDataReader dr = cmd.ExecuteReader();

                if (dr != null && dr.HasRows)
                {
                    while (dr.Read())
                    {
                        userinfo.Id = Convert.ToInt32(dr["ProfileId"].ToString());
                        userinfo.Username = dr["UserName"].ToString();
                        userinfo.Password = dr["Password"].ToString();
                        userinfo.Email= dr["Email"].ToString();
                        userinfo.UserType= Convert.ToInt32(dr["UserType"].ToString());
                        if (userinfo.UserType==3 || userinfo.UserType == 5 || userinfo.UserType == 2)
                        {
                            userinfo.clinicid= Convert.ToInt32(dr["ClinicId"].ToString());
                        }
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
            return userinfo;
        }


    }
}