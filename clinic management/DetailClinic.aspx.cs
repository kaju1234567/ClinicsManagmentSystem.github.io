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
    public partial class DetailClinic : System.Web.UI.Page
    {

        MySqlConnection con;
        public DetailClinic()
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

              
                
                if (Page.IsPostBack == false)
                {
                    //doctor profile details
                    con.Open();
                    string query = @"  SELECT `ProfileId`,`FirstName`, `LastName`, `Cnic`, `Email`, `Contact`, `Qualification`, `Specialization`,imgsource FROM `cms`.`profile`
                                        where UserType=2 AND ClinicId="+Request.QueryString["ClinicId"].ToString();
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
                    string query = @"  SELECT `ProfileId`,`FirstName`, `LastName`, `Cnic`, `Email`, `Contact`, `Qualification`, `Specialization`,imgsource
                        FROM `cms`.`profile` where UserType=2 AND  ClinicId = "+Request.QueryString["ClinicId"].ToString()+"  and  (FirstName like '%" + txtSearch.Text.ToString() + "%' or LastName like '%" + txtSearch.Text.ToString() + "%' " +
                        " or Email like '%" + txtSearch.Text.ToString() + "%' or Qualification like '%" + txtSearch.Text.ToString() + "%' or Specialization like '%" + txtSearch.Text.ToString() + "%') ";
                    MySqlCommand cmd = new MySqlCommand("" + query, con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    Repeater1.DataSource = dr;
                    Repeater1.DataBind();

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
    }
    
}