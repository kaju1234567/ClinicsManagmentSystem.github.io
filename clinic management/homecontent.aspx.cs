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
    public partial class homecontent : System.Web.UI.Page
    {
          MySqlConnection con;
            public homecontent()
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
                        string query = @"  SELECT `ProfileId`,`FirstName`, `LastName`, `Cnic`, `Email`, `Contact`, `Qualification`, `Specialization`,imgsource 
                                                FROM `cms`.`profile` p 
                                                inner join `timetable` t
                                                on t.`DoctorId`=p.`ProfileId`
                                                where UserType=2 and p.`IsActive`=1
                                                group by p.`ProfileId`
                                                limit 0,10;";
                        MySqlCommand cmd = new MySqlCommand("" + query, con);
                        MySqlDataReader dr = cmd.ExecuteReader();
                        Repeater1.DataSource = dr;
                        Repeater1.DataBind();
                    con.Close();

                    //clinic details
                    con.Open();
                    query = @"  SELECT 	c.`ClinicId`, c.`ClinicName`, c.`Contact`, c.`Address` 
                                    FROM `cms`.`clinic` c
                                    INNER JOIN `profile` p
                                    ON c.`ClinicId`=p.`ClinicId`
                                    WHERE c.isactive=1  AND p.`IsActive`=1 AND p.`UserType`=2  
                                    GROUP BY c.`ClinicId`
                                     LIMIT 0,10";
                     cmd = new MySqlCommand("" + query, con);
                     MySqlDataReader dr2 = cmd.ExecuteReader();
                    Repeater2.DataSource = dr2;
                    Repeater2.DataBind();
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

