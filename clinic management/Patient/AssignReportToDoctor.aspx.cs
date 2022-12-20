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
    public partial class AssignReportToDoctor : System.Web.UI.Page
    {
        MySqlConnection con;
        public AssignReportToDoctor()
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
                    Response.Redirect("../Login.aspx");
                }
                if (Page.IsPostBack == false)
                {
                    string query = @"SELECT p.`patientreportid`,pr.`ProfileId`,CONCAT('     ','Patient name is : ',pr.`FirstName`,'(Report name is : ',p.`report`,', Dated: ',DATE(p.`createddatetime`),')') AS 'Report'
                            ,p.`file` 
                            FROM `patientreports` p
                            INNER JOIN `patientappointment` pa
                            ON p.`PatientAppointmentId`= pa.`PatientAppointmentId`
                            INNER JOIN `profile` pr
                            ON pr.`ProfileId`= pa.`PatientId`
                            WHERE pa.`PatientId`= " + user.Id;
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    ddlReports.DataSource = dr;
                    ddlReports.DataTextField = "Report";
                    ddlReports.DataValueField = "patientreportid";
                    ddlReports.DataBind();
                    con.Close();
                    ddlDoctorlist();
                    con.Close();
                    ShowReports();
                }

            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error : " + ex.Message;
            }
            finally
            {
                con.Close();
            }
            
            
        }
        public void ddlDoctorlist()
        {
            try
            {
                string query = @"SELECT p.`ProfileId`,CONCAT(p.`FirstName`,' (Clinic : ',c.`ClinicName`,')') AS 'doctor' 
                                    FROM `cms`.`profile` p 
                                    INNER JOIN `timetable` t
                                    ON t.`DoctorId`=p.`ProfileId`
                                    INNER JOIN `clinic` c
                                    ON p.`ClinicId`=c.`ClinicId`
                                    WHERE p.UserType = 2 
                                    GROUP BY p.`ProfileId`";
                con.Open();
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                ddlDoctor.DataSource = dr;
                ddlDoctor.DataTextField = "doctor";
                ddlDoctor.DataValueField = "ProfileId";
                ddlDoctor.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error : " + ex.Message;
                throw;
            }
            finally
            {
                con.Close();
            }
          
        }
        public void ShowReports()
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
                string query = @"SELECT ar.`patientreportstodrid`,pr.`report`,CONCAT(p.`FirstName`,'( clinic :',c.`ClinicName`,')') AS 'doctor',ar.`fromdate`,ar.`todate`,
                                    if(ar.isactive=1,'Active','Inactive') isactive 
                                        FROM `assignpatientreportstodoctor` ar
                                        INNER JOIN `profile` p
                                        ON ar.`doctorid`=p.`ProfileId`
                                        INNER JOIN clinic c
                                        ON p.`ClinicId`=c.`ClinicId`
                                        INNER JOIN `patientreports` pr
                                        ON ar.`patientreportid`=pr.`patientreportid`
                                        INNER JOIN `patientappointment` pa
                                        ON pa.`PatientAppointmentId`=pr.`PatientAppointmentId`
                                        WHERE pa.`PatientId`=" + user.Id+" AND p.`ProfileId`=" + ddlDoctor.SelectedValue.ToString() + " ";
                con.Open();
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    griddoctorreports.Visible = true;
                    lblMsg.Text = "";
                    griddoctorreports.DataSource = dr;
                    griddoctorreports.DataBind();
                    Hidecolumn();
                }
                else
                {
                    griddoctorreports.Visible = false;
                    lblMsg.Text = "No record found";
                }
                con.Close();



            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error to show reports : " + ex.Message;
                
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
                string query = "";

                if (btnSave.Text == "Save")
                {
                    query = @"INSERT INTO `cms`.`assignpatientreportstodoctor`(`patientreportid`,`doctorid`,`createdby`,`fromdate`,`todate`,`isactive`)
                                    VALUES (" + ddlReports.SelectedValue.ToString() + "," + ddlDoctor.SelectedValue.ToString() + "," + user.Id + ",'" + txtFromDate.Value.ToString()
                                    + "','" + txtToDate.Value.ToString() + "',1);";
                }
                else
                {
                    string patientreportstodrid = (string)ViewState["patientreportstodrid"].ToString();
                    query = @"Update `cms`.`assignpatientreportstodoctor` set `fromdate`='"+txtFromDate.Value.ToString()+"',`todate`='"+txtToDate.Value.ToString()
                        + "' where patientreportstodrid="+ patientreportstodrid;
                }

                string chkQuery = "SELECT * FROM assignpatientreportstodoctor WHERE patientreportid=" + ddlReports.SelectedValue.ToString() + " AND doctorid=" + ddlDoctor.SelectedValue.ToString();
                con.Close();
                con.Open();
                MySqlCommand cmd = new MySqlCommand("" + chkQuery, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    lblMsg.Text = "Select report is already assigned to doctor...!";
                    con.Close();
                }
                else {
                    con.Close();
                    con.Open();
                    cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        if (btnSave.Text == "Save")
                        {
                            lblMsg.Text = "Successfully added...";
                        }
                        else
                        {
                            lblMsg.Text = "Successfully updated...";
                            ddlReports.Enabled = true;
                            ddlDoctor.Enabled = true;
                            btnSave.Text = "Save";
                        }

                    }
                    con.Close();

                    query = @"SELECT p.`patientreportid`,pr.`ProfileId`,CONCAT('     ','Patient name is : ',pr.`FirstName`,'(Report name is : ',p.`report`,', Dated: ',DATE(p.`createddatetime`),')') AS 'Report'
                            ,p.`file` 
                            FROM `patientreports` p
                            INNER JOIN `patientappointment` pa
                            ON p.`PatientAppointmentId`= pa.`PatientAppointmentId`
                            INNER JOIN `profile` pr
                            ON pr.`ProfileId`= pa.`PatientId`
                            WHERE pa.`PatientId`= " + user.Id;
                    con.Open();
                    cmd = new MySqlCommand("" + query, con);
                    dr = cmd.ExecuteReader();
                    ddlReports.DataSource = dr;
                    ddlReports.DataTextField = "Report";
                    ddlReports.DataValueField = "patientreportid";
                    ddlReports.DataBind();
                    con.Close();
                    ddlDoctorlist();
                    ShowReports();


                }



            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error to Assign : "+ex.Message;
            }
        }

        protected void ddlDoctor_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ShowReports();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error on change : " + ex.Message;
            }
        }

        void Hidecolumn()
        {
            try
            {
                griddoctorreports.HeaderRow.Cells[2].Visible = false;
                foreach (GridViewRow gvr in griddoctorreports.Rows)
                {
                    gvr.Cells[2].Visible = false;
                    //ar.`patientreportstodrid`,pr.`report`,CONCAT(p.`FirstName`,'( clinic :',c.`ClinicName`,')') AS 'doctor',ar.`fromdate`,ar.`todate`,ar.isactive
                    if (gvr.Cells[7].Text.ToString() == "Active")
                    {
                        Button btn = gvr.FindControl("btnDelete") as Button;
                        btn.Text = "Deactivate";
                    }
                    else
                    {
                        Button btn = gvr.FindControl("btnDelete") as Button;
                        btn.Text = "Activate";
                    }


                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                //ar.`patientreportstodrid`,pr.`report`,CONCAT(p.`FirstName`,'( clinic :',c.`ClinicName`,')') AS 'doctor',ar.`fromdate`,ar.`todate`,ar.isactive
                btnSave.Text = "Update";
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string patientreportstodrid = gvr.Cells[2].Text.ToString();
                ViewState["patientreportstodrid"] = patientreportstodrid;

                string query = @"SELECT `patientreportid`,`doctorid`,`createdby`,`createddate`,`fromdate`,`todate`,`isactive` 
                                    FROM `cms`.`assignpatientreportstodoctor`
                                    WHERE `patientreportstodrid`=" + patientreportstodrid;
                con.Open();
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ddlDoctor.Items.FindByValue(""+dr["doctorid"].ToString()).Selected = true;
                        ddlDoctor.Enabled = false;
                        ddlReports.Items.FindByValue("" + dr["patientreportid"].ToString()).Selected = true;
                        ddlReports.Enabled = false;
                        txtFromDate.Value = "" + dr["fromdate"].ToString();
                        txtToDate.Value = "" + dr["todate"].ToString();
                    }
                }

                con.Close();
                


            }
            catch (Exception ex)
            {

            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                //ar.`patientreportstodrid`,pr.`report`,CONCAT(p.`FirstName`,'( clinic :',c.`ClinicName`,')') AS 'doctor',ar.`fromdate`,ar.`todate`,ar.isactive
                //btnSave.Text = "Update";
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string patientreportstodrid = gvr.Cells[2].Text.ToString();
                string query = "";
                if (gvr.Cells[7].Text.ToString() == "Active")
                {
                    query = "Update assignpatientreportstodoctor set isactive=0 where patientreportstodrid=" + patientreportstodrid;
                    lblMsg.Text = "" + gvr.Cells[3].Text.ToString() + " Report is deactivated...";
                }
                else
                {
                    query = "Update assignpatientreportstodoctor set isactive=1 where patientreportstodrid=" + patientreportstodrid;
                    lblMsg.Text = "" + gvr.Cells[3].Text.ToString() + " Report is Activated...";
                }
                
                con.Open();
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                if (cmd.ExecuteNonQuery() > 0)
                {
               
                    con.Close();
                    ShowReports();
                }

            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error to deactivate...!";
            }
            finally
            {
                con.Close();
            }
        }
    }
}