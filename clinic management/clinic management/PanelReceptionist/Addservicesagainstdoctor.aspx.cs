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
    public partial class Addservicesagainstdoctor : System.Web.UI.Page
    {
        MySqlConnection con;
        public Addservicesagainstdoctor()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                con = new MySqlConnection("" + constr);
            }
            catch (Exception ex)
            {


            }
            finally
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
                    Response.Redirect("../Login.aspx");
                }
                if (Page.IsPostBack == false)
                {
                    lbldoctor.Text = "" + Request.QueryString["doctorname"].ToString();
                    string query = @"SELECT  ct.`ClinicTypeId`,ct.`ClinicType`,
                                    ct.`Description`,IF(ct.`IsActive`= 1, 'Active', 'Inactive') AS 'Isactive',
                                    p.`FirstName` AS 'Createdby',c.`ClinicName` 'Clinic'
                                    FROM `cms`.`clinictype` ct
                                    INNER JOIN `profile` p
                                    ON p.`ProfileId`= ct.`createdby`
                                    INNER JOIN `clinic` c
                                    ON c.`ClinicId`= p.`ClinicId`
                                    WHERE p.`ClinicId`= " + user.clinicid;
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        chkList.DataSource = dr;
                        chkList.DataTextField = "ClinicType";
                        chkList.DataValueField = "ClinicTypeId";
                        chkList.DataBind();
                        con.Close();
                        con.Open();
                        // pre selected services

                        string profileid = Request.QueryString["profileid"].ToString();
                        query = @" SELECT `clinictypeid`,`doctorid`,`clinicid`,`isactive`,`createdby`
                                            FROM `cms`.`doctorservices` ds
                                              WHERE ds.isactive=1 AND ds.`clinicid`=" + user.clinicid+" AND ds.`doctorid`="+profileid;
                        cmd = new MySqlCommand(query, con);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                chkList.Items.FindByValue(""+dr["clinictypeid"].ToString()).Selected = true;
                            }
                        }

                        con.Close();
                      
                    }
                    con.Close();

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

        protected void btnSave_Click(object sender, EventArgs e)
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
                    Response.Redirect("../Login.aspx");
                }
                //int index = 0;

                con.Open();
                string profileid = Request.QueryString["profileid"].ToString();
                string delquery = "Delete from doctorservices  where doctorid=" + profileid;
                MySqlCommand cmd = new MySqlCommand(delquery, con);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    lblMsg.Text = "Record has been deleted....!";

                }
                con.Close();
                for (int index = 0; index < chkList.Items.Count; index++)
                {
                    if (chkList.Items[index].Selected == true)
                    {
                        
                        con.Open();
                        string query = @" INSERT INTO `cms`.`doctorservices`(`clinictypeid`,`doctorid`,`clinicid`,`isactive`,`createdby`,`modifiedby`,`modifieddate`)
                                            VALUES(" + chkList.Items[index].Value.ToString() + ", " + profileid + ", " + user.clinicid + ", 1, " + user.Id + ", " + user.Id + ",now()); ";
                        cmd = new MySqlCommand(query, con);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            lblMsg.Text = "Doctor services has been inserted....!";
                        }
                        else
                        {
                            lblMsg.Text = "Error to Insert record....!";
                        }
                        con.Close();
                    }
                    //chkList.Items[index].Selected = true;
                }

            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error to insert doctor services : " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}