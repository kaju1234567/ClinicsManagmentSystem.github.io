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
    public partial class Addsymptomforreceptionist : System.Web.UI.Page
    {
        MySqlConnection con;
        public Addsymptomforreceptionist()
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
                    btnsubmit.InnerText = "Add";
                    LoadSymptoms();
                }

            }
            catch (Exception ex)
            {

            }
        }
        public void LoadSymptoms()
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
                con.Open();
                string query = @"SELECT s.`symptomid`,s.`symptom`,s.`description`,d.`disease`,cs.`ClinicType` as 'Service',
                                        if(s.`isactive`=1,'Active','Inactive') as 'Isactive',p.`FirstName` as 'createdby',s.`createddate`
                                        FROM `cms`.`tbldisease` d
                                        INNER JOIN  `clinictype` cs
                                        ON d.`clinicserviceid`=cs.`ClinicTypeId`
                                        inner join `symptoms` s
                                        on d.`diseaseid`=s.`diseaseid`
                                        INNER JOIN `profile` p
                                        ON p.`ProfileId`=s.`createdby`
                                        WHERE s.`diseaseid`=" + Request.QueryString["diseaseid"].ToString() + " AND  p.`ClinicId`=" + user.clinicid;
                MySqlCommand cmd = new MySqlCommand("" + query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    GridView1.DataSource = dr;
                    GridView1.DataBind();
                    //Hidecolumn();
                }
            }
            catch (Exception ex)
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
                int isactive = 0;
                if (chkIsactive.Checked == true)
                {
                    isactive = 1;
                }
                if (txtSymptoms.Value.ToString().Length > 0)
                {

                    con.Open();
                    string query = "";
                    if (btnsubmit.InnerText == "Add")
                    {
                         query = @"insert into `cms`.`symptoms`(`symptom`,`diseaseid`,`description`,`createdby`,`modifiedby`,`modifieddate`,`isactive`)
                                        values ('" + txtSymptoms.Value.ToString() + "'," + Request.QueryString["diseaseid"].ToString() + ",'" + txtDecription.Value.ToString()
                                        + "'," + user.Id + "," + user.Id + ",now()," + isactive + ");";
                    }
                    else if(btnsubmit.InnerText == "Update")
                    {
                        string symptomsid = (string)ViewState["symptomsid"];
                         query = @"update `cms`.`symptoms` 
                            set `symptom` = '" + txtSymptoms.Value.ToString()
                            +"',`description` = '"+txtDecription.Value.ToString()
                            +"',`modifiedby` = "+user.Id+",`modifieddate` = now()," +
                            " `isactive` = "+isactive+" where `symptomid` = "+symptomsid;
                    }
                    
                    MySqlCommand cmd = new MySqlCommand(""+query, con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        if (btnsubmit.InnerText == "Add")
                        {
                            lblMsg.Text = "Record has been Inserted...";
                        }
                        else
                        {
                            lblMsg.Text = "Record has been Updated...";
                        }
                        
                        txtSymptoms.Value = "";
                        txtDecription.Value = "";
                        btnsubmit.InnerText = "Add";
                        con.Close();
                        LoadSymptoms();
                    }
                    else
                    {
                        lblMsg.Text = "Something is missing....!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error to Insert symptoms : "+ex.Message+"....!";
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender as Button;
                TableCell cell = (TableCell)btn.Parent;
                GridViewRow gvr = (GridViewRow)cell.Parent;
                string symptomsid = gvr.Cells[1].Text.ToString();
                ViewState["symptomsid"] = symptomsid;
                btnsubmit.InnerText = "Update";
                txtSymptoms.Value= gvr.Cells[2].Text.ToString();
                txtDecription.Value = gvr.Cells[3].Text.ToString();
                string isactive = gvr.Cells[6].Text.ToString();
                chkIsactive.Checked = false;
                if (isactive == "Active")
                {
                    chkIsactive.Checked = true;
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}