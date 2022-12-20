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
    public partial class Adddoctortimetable : System.Web.UI.Page
    {


        MySqlConnection con;
        public Adddoctortimetable()
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

            Userinfo user = null;
            if (Session["Username"] != null)
            {
                user = (Userinfo)Session["Username"];

            }
            else
            {
                Response.Redirect("../Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                ddlDays.Items.Add("Monday");
                ddlDays.Items.Add("Tuesday");
                ddlDays.Items.Add("Wednesday");
                ddlDays.Items.Add("Thursday");
                ddlDays.Items.Add("Friday");
                ddlDays.Items.Add("Saturday");
                ddlDays.Items.Add("Sunday");
                Loadddl();
                DdlDoctor();
            }
            
        }

        public void Loadddl()
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

                string query = @"SELECT t.`timeid`,t.`time`,p.`FirstName`,t.`createddate`,IF(t.`isactive`=1,'Active','Inactive') AS isactive,c.`ClinicName`
                                        FROM `cms`.`time` t
                                        INNER JOIN `clinic` c
                                        ON t.`clinicid`=c.`ClinicId`
                                        INNER JOIN `profile` p
                                        ON p.`ProfileId`=t.`createdby`
                                        where c.`ClinicId`=" + user.clinicid;
                con.Open();

                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                var list = dr;
                if (dr.HasRows)
                {
                    ddlfromtime.DataSource = list;
                    ddlfromtime.DataTextField = "time";
                    ddlfromtime.DataValueField = "timeid";
                    ddlfromtime.DataBind();
                    con.Close();

                    query = @"SELECT t.`timeid`,t.`time`,p.`FirstName`,t.`createddate`,IF(t.`isactive`=1,'Active','Inactive') AS isactive,c.`ClinicName`
                                        FROM `cms`.`time` t
                                        INNER JOIN `clinic` c
                                        ON t.`clinicid`=c.`ClinicId`
                                        INNER JOIN `profile` p
                                        ON p.`ProfileId`=t.`createdby`
                                        where c.`ClinicId`=" + user.clinicid;
                    con.Open();

                    cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr2 = cmd.ExecuteReader();
                    ddltotime.DataSource = dr2;
                    ddltotime.DataTextField = "time";
                    ddltotime.DataValueField = "timeid";
                    ddltotime.DataBind();


                }
                else
                {
                    lblMsg.Text = "Error to Insert Loadddl....";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }

            }
            catch (Exception ex)
            {

                lblMsg.Text = "Error to View Loadddl....";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();

            }

        }

        public void DdlDoctor()
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

                string query = @"SELECT p.`ProfileId`,CONCAT(p.`FirstName`,' (',p.Qualification,')') FirstName,p.`Contact`,p.`Address`, p.`Gender`,p.`Email`, p.`Qualification`, p.`Specialization`,
                                     p.`UserName`,p.`Password`,IF(c.`IsActive`= 1, 'Active', 'Inactive') 'isactive'
                                    FROM clinic c
                                    INNER JOIN `profile` p
                                    ON c.clinicid = p.clinicid
                                    WHERE p.`UserType`= 2 AND c.`ClinicId`=" + user.clinicid;
                con.Open();

                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                var list = dr;
                if (dr.HasRows)
                {
                    ddlDoctors.DataSource = list;
                    ddlDoctors.DataTextField = "FirstName";
                    ddlDoctors.DataValueField = "ProfileId";
                    ddlDoctors.DataBind();
                   

                }
                else
                {
                    lblMsg.Text = "Error to Insert DdlDoctor....";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }

            }
            catch (Exception ex)
            {

                lblMsg.Text = "Error to View DdlDoctor....";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();

            }

        }

        protected void btnsubmit_ServerClick(object sender, EventArgs e)
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

                if(!string.IsNullOrEmpty(ddlDays.SelectedItem.Text) && !string.IsNullOrEmpty(ddlDoctors.SelectedItem.Text) && !string.IsNullOrEmpty(ddlfromtime.SelectedItem.Text) && !string.IsNullOrEmpty(ddltotime.SelectedItem.Text) && !string.IsNullOrEmpty(txtDecription.Value)
                    )
                {

                    
                    int fhh = Convert.ToInt32(ddlfromtime.SelectedItem.Text.Split(':')[0].ToString());
                    int thh = Convert.ToInt32(ddltotime.SelectedItem.Text.Split(':')[0].ToString());

                    int fmint = Convert.ToInt32(ddlfromtime.SelectedItem.Text.Split(':')[1].ToString());
                    int tmint = Convert.ToInt32(ddltotime.SelectedItem.Text.Split(':')[1].ToString());


                    DateTime  fdate = Convert.ToDateTime(new DateTime(2009, 8, 1, fhh, fmint, 0).ToString("MM/dd/yyyy hh:mm tt")); 
                    DateTime todate = Convert.ToDateTime(new DateTime(2009, 8, 1, thh, tmint, 0).ToString("MM/dd/yyyy hh:mm tt"));

                    fdate.Date.ToString("yyyy-MM-dd");

                    int result = DateTime.Compare(todate, fdate);
                    if (ddltotime.SelectedItem.Text != ddlfromtime.SelectedItem.Text && result>0) 
                    {
                        string isactive = "0";
                        if (chkIsactive.Checked)
                        {
                            isactive = "1";
                        }
                        string query = @"INSERT INTO `cms`.`timetable`(`ClinicId`,`DoctorId`,`FromTime`,`ToTime`,`Description`,`CreatedBy`,`IsActive`,`day`)
                                VALUES ('" + user.clinicid + "'," + ddlDoctors.SelectedValue.ToString() + "," + ddlfromtime.SelectedValue.ToString() + "," + ddltotime.SelectedValue.ToString()
                                + ",'" + txtDecription.Value.ToString() + "'," + user.Id + ","+ isactive + ",'" + ddlDays.Text.ToString() + "');";
                        con.Open();

                        MySqlCommand cmd = new MySqlCommand("" + query, con);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            lblMsg.Text = "Doctor time has been added....!";
                            if (ddlDoctors.SelectedValue.ToString() != "" && ddlDoctors.SelectedValue.ToString()!=null)
                            {
                                Response.Redirect("Viewdoctortimeforreceptionist.aspx?profileid=" + ddlDoctors.SelectedValue.ToString());
                            }
                            
                        }
                        else
                        {
                            lblMsg.Text = "Missing fields....!";
                        }

                    }
                    else
                    {
                        lblMsg.Text = "Fromtime and to time must not be equal....!";
                    }
                    

                }
                else
                {
                    lblMsg.Text = "Missing fields....!";
                }




            }
            catch (Exception ex)
            {
                lblMsg.Text = "Exception : "+ex.Message;

            }
        }
    }
}