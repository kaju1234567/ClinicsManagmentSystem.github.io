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
    public partial class Viewdoctorforpatient : System.Web.UI.Page
    {

        MySqlConnection con;
        public Viewdoctorforpatient()
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
                        //doctor profile details
                        con.Open();
                        string query = @"  SELECT p.`ProfileId`,p.`FirstName`, p.`LastName`, p.`Cnic`, p.`Email`, p.`Contact`, p.`Qualification`, p.`Specialization`,p.imgsource,c.`ClinicName` 
                                                FROM `cms`.`profile` p 
                                                inner join `timetable` t
                                                on t.`DoctorId`=p.`ProfileId`
                                                INNER JOIN `clinic` c
                                                on c.`ClinicId`=t.`ClinicId`
                                                where UserType=2 and p.`IsActive`=1 and c.isactive=1
                                                group by p.`ProfileId`
                                                limit 0,10";
                        MySqlCommand cmd = new MySqlCommand("" + query, con);
                        MySqlDataReader dr = cmd.ExecuteReader();
                        Repeater1.DataSource = dr;
                        Repeater1.DataBind();
                        con.Close();



                    //@" SELECT tt.`TimeTableId`,p.`ProfileId`,p.`FirstName`,p.`Specialization`,p.`Qualification`,
                    //                p.`imgsource`,ft.`time` ftime,tot.`time` ttime,tt.`day`,c.`ClinicId`,c.`ClinicName`
                    //                FROM `timetable` tt
                    //                INNER JOIN `time` ft
                    //                ON tt.`FromTime`=ft.`timeid`
                    //                INNER JOIN `time` tot
                    //                ON tt.`ToTime`=tot.`timeid`
                    //                INNER JOIN `profile` p
                    //                ON tt.`DoctorId`=p.`ProfileId`
                    //                INNER JOIN `clinic` c
                    //                ON tt.`ClinicId`=c.`ClinicId`
                    //                WHERE p.`ProfileId`=" + doctorid + "  and  p.UserType=2 limit 0,10";
                    //MySqlCommand cmd = new MySqlCommand("" + query, con);
                    //MySqlDataReader dr = cmd.ExecuteReader();
                    //Repeater1.DataSource = dr;
                    //Repeater1.DataBind();

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

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text.ToString() != "" && txtSearch.Text.ToString() != null)
                {
                    con.Open();
                    string query = @"SELECT p.`ProfileId`,p.`FirstName`, p.`LastName`, p.`Cnic`, p.`Email`, p.`Contact`, p.`Qualification`, p.`Specialization`,p.imgsource ,c.`ClinicName` 
                                            FROM `cms`.`profile` p 
                                            INNER JOIN `timetable` t
                                            ON t.`DoctorId`=p.`ProfileId`
                                            LEFT JOIN `clinic` c
                                            ON p.`ClinicId`=c.`ClinicId`
                                            LEFT JOIN  `doctorservices` ds
                                            ON p.`ProfileId`=ds.`doctorid`
                                            LEFT JOIN `clinictype` dt
                                            ON ds.`clinictypeid`=dt.`ClinicTypeId` AND ds.`isactive`=1
                                            LEFT JOIN `tbldisease` d 
                                            ON ds.`clinictypeid`=d.`clinicserviceid`
                                            left join `symptoms` s 
                                            on d.`diseaseid`=s.`diseaseid`
                                            WHERE p.UserType = 2 AND  c.isactive=1 and
                                            (s.`symptom` LIKE '%" + txtSearch.Text.ToString()+"%'  OR d.`disease` LIKE '%" + txtSearch.Text.ToString() + "%' OR dt.`ClinicType` LIKE  '%" + txtSearch.Text.ToString() + "%' OR p.FirstName LIKE '%" + txtSearch.Text.ToString()
                                        + "%' OR p.LastName LIKE '%" + txtSearch.Text.ToString() + "%' " +
                                        " OR p.Email LIKE '%" + txtSearch.Text.ToString()
                                        + "%' OR p.Qualification LIKE '%" + txtSearch.Text.ToString()
                                        + "%' OR p.Specialization LIKE '%" + txtSearch.Text.ToString() + "%')   " +
                                        " GROUP BY p.`ProfileId` ";
                    //string query = @"  SELECT `ProfileId`,`FirstName`, `LastName`, `Cnic`, `Email`, `Contact`, `Qualification`, `Specialization`,imgsource
                    //    FROM `cms`.`profile` where UserType=2  and  (FirstName like '%"+txtSearch.Text.ToString()+ "%' or LastName like '%" + txtSearch.Text.ToString() + "%' " +
                    //    " or Email like '%" + txtSearch.Text.ToString() + "%' or Qualification like '%" + txtSearch.Text.ToString() + "%' or Specialization like '%" + txtSearch.Text.ToString() + "%') ";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        Repeater1.DataSource = dr;
                        Repeater1.DataBind();
                        Repeater1.Visible = true;
                        lblMsg.Visible = false;
                    }
                    else
                    {
                        Repeater1.Visible = false;
                        lblMsg.Visible = true;
                        lblMsg.Text = "Please Enter value for search...!";
                    }

                }
                else
                {
                    //con.Open();
                    //string query = @"SELECT p.`ProfileId`,p.`FirstName`, p.`LastName`, p.`Cnic`, p.`Email`, p.`Contact`, p.`Qualification`, p.`Specialization`,p.imgsource ,c.`ClinicName` 
                    //                        FROM `cms`.`profile` p 
                    //                        INNER JOIN `timetable` t
                    //                        ON t.`DoctorId`=p.`ProfileId`
                    //                        LEFT JOIN `clinic` c
                    //                        ON p.`ClinicId`=c.`ClinicId`
                    //                        LEFT JOIN  `doctorservices` ds
                    //                        ON p.`ProfileId`=ds.`doctorid`
                    //                        LEFT JOIN `clinictype` dt
                    //                        ON ds.`clinictypeid`=dt.`ClinicTypeId` AND ds.`isactive`=1
                    //                        LEFT JOIN `tbldisease` d 
                    //                        ON ds.`clinictypeid`=d.`clinicserviceid`
                    //                        WHERE p.UserType = 2  GROUP BY p.`ProfileId` ";
                    //MySqlCommand cmd = new MySqlCommand("" + query, con);
                    //MySqlDataReader dr = cmd.ExecuteReader();
                    //Repeater1.DataSource = dr;
                    //Repeater1.DataBind();
                    Repeater1.Visible = false;
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please Enter value for search...!";

                }
                
            }
            catch (Exception ex)
            {
                Repeater1.Visible = false;
                lblMsg.Visible = true;
                lblMsg.Text = "Error to view Doctor : "+ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }
        }
    }
}