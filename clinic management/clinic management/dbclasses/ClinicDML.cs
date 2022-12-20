using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Web;

namespace clinic_management.dbclasses
{
    public class ClinicDML
    {
        MySqlConnection con;
        public ClinicDML()
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

        public string ADDCLINIC(string clinname, string contact, string address, string lat, string longitude, int isactive, int creadtedby,string email,string password)
        {
            string msg = "notInserted";
            try
            {


                con.Open();
                string query = "Select * from profile p where p.email='" + email + "'";
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == false)
                {
                    con.Close();
                    con.Open();
                    query = @"INSERT INTO `clinic` (`ClinicName`, `Contact`, `Address`, `Latitude`, `Longitude`, `IsActive`, `createdby`)
	                        VALUES( '" + clinname + "','" + contact + "', '" + address + "', '" + lat + "','" + longitude + "'," + isactive + "," + creadtedby + ");";

                    cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        msg = "Inserted";
                        long id = cmd.LastInsertedId;
                        con.Close();
                        con.Open();

                        query = @"INSERT INTO `cms`.`profile`(`FirstName`,`LastName`,`Contact`,`Email`,`Address`,`UserName`,`Password`,`UserType`,`IsActive`,`ClinicId`)
                                VALUES('" + clinname + "', '" + clinname + "', '" + contact + "', '" + email + "', '" + address + "', '" + email + "', '" + password + "', '5', '1', '" + id + "'); ";

                        cmd = new MySqlCommand("" + query, con);
                        if (cmd.ExecuteNonQuery() > 0)
                        {

                            // email code start

                            var fromAddress = new MailAddress("kajubhutrani@gmail.com", "kajubhutrani@gmail.com");
                            var toAddress = new MailAddress("" + email, "");
                            const string fromPassword = "Kajal123/.";
                            const string subject = "Clinic credentials";
                            string body = "Dear Sir/Madam,\nFollowing are the credential for your clinic on AK Service. \n Username : " + email + " \nPassword : " + password;

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
                    }
                    else
                    {
                        msg = "notInserted";
                    }

                }
                else
                {

                    msg = email+" Already Exist....!";
                }

                


            }
            catch (Exception ex)
            {

                msg = "Error in ADDCLINIC:" + ex.Message;
            }
            finally
            {
                con.Close();
            }
            return msg;

        }

        //public Userinfo Loginverify(string username, string pwd)
        //{
        //    Userinfo userinfo = new Userinfo();
        //    try
        //    {
        //        con.Open();
        //        MySqlCommand cmd = new MySqlCommand("SELECT * FROM `profile` f WHERE f.`UserName`='" + username + "' AND f.`Password`='" + pwd + "'", con);
        //        MySqlDataReader dr = cmd.ExecuteReader();

        //        if (dr != null && dr.HasRows)
        //        {
        //            while (dr.Read())
        //            {
        //                userinfo.Id = Convert.ToInt32(dr["ProfileId"].ToString());
        //                userinfo.Username = dr["UserName"].ToString();
        //                userinfo.Password = dr["Password"].ToString();
        //                userinfo.UserType = Convert.ToInt32(dr["UserType"].ToString());
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //    return userinfo;
        //}


    }
}