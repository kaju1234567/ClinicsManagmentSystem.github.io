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
    public partial class Addtime : System.Web.UI.Page
    {


        MySqlConnection con;
        public Addtime()
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

                if (!Page.IsPostBack)
                {
                    btnsubmit.InnerText = "Add";
                    ViewData();

                }
               


            }
            catch (Exception ex)
            {

            }

        }

        void Hidecolumn()
        {
            try
            {
                gridviewtime.HeaderRow.Cells[1].Visible = false;
                foreach (GridViewRow gvr in gridviewtime.Rows)
                {
                    gvr.Cells[1].Visible = false;


                }
            }
            catch (Exception ex)
            {

            }
        }


        protected void btnsubmit_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Userinfo user = (Userinfo)Session["Username"];
                if (txtTime.Value.ToString() != null && txtTime.Value.ToString() != "")
                {
                    int ischk = 0;
                    if (chkIsactive.Checked==false)
                    {
                        ischk = 1;
                    }
                    con.Open();
                    string query = " ";
                    if (btnsubmit.InnerText == "Add")
                    {
                        query = @"INSERT INTO `cms`.`time`(`time`,`createdby`,`isactive`,`clinicid`)
                                        VALUES ('" + txtTime.Value.ToString() + "'," + user.Id + ",1," + user.clinicid + ");";
                    }
                    else if (btnsubmit.InnerText == "Update")
                    {
                        string timeid = (string)ViewState["timeid"];
                        query = @" Update `cms`.`time` set `time`='" + txtTime.Value.ToString() + "',`isactive`=" + ischk + ",`modifiedby` = "+user.Id+",  `modifieddate` = now()" +
                            " where timeid= "+timeid;
                    }
                        
                    

                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    if (cmd.ExecuteNonQuery() != 0)
                    {
                        if (btnsubmit.InnerText == "Add")
                        {
                            lblMsg.Text = "Time has been Inserted....";
                        }
                        else
                        {
                            lblMsg.Text = "Time has been Updated....";
                        }
                        chkIsactive.Checked = false;
                        txtTime.Value = "";
                        btnsubmit.InnerText = "Add";
                        con.Close();
                        ViewData();


                    }
                    else
                    {
                        lblMsg.Text = "Error to Insert Addtime....";
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

                lblMsg.Text = "Error to Insert Addtime:" + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();

            }

        }

        public void ViewData()
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
                if (dr.HasRows)
                {
                    gridviewtime.DataSource = dr;
                    gridviewtime.DataBind();
                    Hidecolumn();


                }
                else
                {
                    lblMsg.Text = "Error to Insert Addtime....";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
               
            }
            catch (Exception ex)
            {

                lblMsg.Text = "Error to View Addtime....";
                lblMsg.ForeColor = System.Drawing.Color.Red;
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
                string timeid = gvr.Cells[1].Text.ToString();
                ViewState["timeid"] = timeid;
                txtTime.Value= gvr.Cells[2].Text.ToString();
                string isactive= gvr.Cells[5].Text.ToString();
                chkIsactive.Checked = false;
                if (isactive == "Active")
                {
                    chkIsactive.Checked = true;
                }
                btnsubmit.InnerText = "Update";

            }
            catch (Exception ex)
            {

            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
        }
    }
}