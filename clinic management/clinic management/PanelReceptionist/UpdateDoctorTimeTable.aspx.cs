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
    public partial class UpdateDoctorTimeTable : System.Web.UI.Page
    {
        MySqlConnection con;
        public UpdateDoctorTimeTable()
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

                string query = "SELECT t.`TimeTableId`,t.`ClinicId`,t.`DoctorId`,t.`FromTime`,t.`ToTime`,t.`Description`,t.`CreatedDate`,t.`CreatedBy`,t.`ModifiedDate`,t.`IsActive`,t.`day` " +
                    "    FROM `timetable` t WHERE t.`TimeTableId`=" + Request.QueryString["TimeTableId"].ToString();
                con.Open();
                MySqlCommand cmd = new MySqlCommand(""+query,con);
                MySqlDataReader dr = cmd.ExecuteReader();


                while (dr.Read())
                {
                    ddlDoctors.Items.FindByValue("" + dr["DoctorId"].ToString()).Selected = true;
                    ddlfromtime.Items.FindByValue("" + dr["FromTime"].ToString()).Selected = true;
                    ddltotime.Items.FindByValue("" + dr["ToTime"].ToString()).Selected = true;
                    ddlDays.Items.FindByValue("" + dr["day"].ToString()).Selected = true;
                    txtDecription.Value = "" + dr["Description"].ToString();
                    chkIsactive.Checked = false;
                    if (dr["IsActive"].ToString() + "" == "1")
                    {
                        chkIsactive.Checked = true;
                    }
                }
                con.Close();

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

        protected void btnUpdate_ServerClick(object sender, EventArgs e)
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

                if (!string.IsNullOrEmpty(ddlDays.SelectedItem.Text) && !string.IsNullOrEmpty(ddlDoctors.SelectedItem.Text) && !string.IsNullOrEmpty(ddlfromtime.SelectedItem.Text) && !string.IsNullOrEmpty(ddltotime.SelectedItem.Text) && !string.IsNullOrEmpty(txtDecription.Value)
                    )
                {

                    if (ddltotime.SelectedItem.Text != ddlfromtime.SelectedItem.Text)
                    {
                        string isactive = "0";
                        if (chkIsactive.Checked)
                        {
                            isactive = "1";
                        }
                        
                        //string query = @"INSERT INTO `cms`.`timetable`(`ClinicId`,`DoctorId`,`FromTime`,`ToTime`,`Description`,`CreatedBy`,`IsActive`,`day`)
                        //        VALUES ('" + user.clinicid + "'," + ddlDoctors.SelectedValue.ToString() + "," + ddlfromtime.SelectedValue.ToString() + "," + ddltotime.SelectedValue.ToString()
                        //        + ",'" + txtDecription.Value.ToString() + "'," + user.Id + "," + isactive + ",'" + ddlDays.Text.ToString() + "');";

                        string query= @"update `cms`.`timetable` set  `FromTime` = "+ ddlfromtime.SelectedValue.ToString() + ",`ToTime` ="+ ddltotime.SelectedValue.ToString() + " ,`Description` = '"+txtDecription.Value.ToString()
                            +"',`ModifiedDate` = 'now()',`IsActive` = "+isactive+",`day` = '"+ddlDays.Text.ToString()+"' where `TimeTableId` = " + Request.QueryString["TimeTableId"].ToString();
                        con.Open();

                        MySqlCommand cmd = new MySqlCommand("" + query, con);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Write("<Script>alert('Record has been updated...1')</Script>");
                            con.Close();
                            string ProfileId = Request.QueryString["ProfileId"].ToString();
                            if (ProfileId != null)
                            {
                                Response.Redirect("Viewdoctortimeforreceptionist.aspx?ProfileId=" + ProfileId);
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
                lblMsg.Text = "Exception : " + ex.Message;

            }
        }
    }
}