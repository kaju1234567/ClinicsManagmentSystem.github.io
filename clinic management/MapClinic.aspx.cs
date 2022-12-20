using MySql.Data.MySqlClient;
using Subgurim.Controles;
using Subgurim.Controles.GoogleChartIconMaker;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic_management
{
    public partial class MapClinic : System.Web.UI.Page
    {
        public class Clinic
        {
            public int Id { get; set; }
            public string Clinicname { get; set; }
            public string lat { get; set; }
            public string longit { get; set; }
            public string contact { get; set; }
            public string Address { get; set; }
        }
        MySqlConnection con;
        public MapClinic()
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
                if (!IsPostBack)
                {
                    // Here I used Degha Location as Main Location and Lat Long is : 21.622564, 87.523417
                    GLatLng mainLocation = new GLatLng(25.3876998, 68.363723);
                    GMap1.setCenter(mainLocation, 15);

                    XPinLetter xpinLetter = new XPinLetter(PinShapes.pin_star, "H", Color.Blue, Color.White, Color.Chocolate);
                    GMap1.Add(new GMarker(mainLocation, new GMarkerOptions(new GIcon(xpinLetter.ToString(), xpinLetter.Shadow()))));

                    List<Clinic> clinics = new List<Clinic>();

                    con.Open();
                    string query = "";
                    MySqlCommand cmd = new MySqlCommand(@"select c.`ClinicId`, c.`ClinicName`, c.`Contact`, c.`Address`, c.`Latitude`,
                                                        c.`Longitude`, c.`IsActive`, c.`createddate`,
                                                        c.`createdby`, c.`updatedby`, c.`updateddate`
                                                        FROM clinic c
                                                            inner join `profile` p
                                                            on c.`ClinicId`= p.`ClinicId`
                                                            INNER JOIN `timetable` t
                                                            ON t.`DoctorId`= p.`ProfileId`
                                                            where c.isactive = 1 AND p.`IsActive`= 1 AND p.`UserType`= 2
                                                            GROUP BY c.`ClinicId` limit 0, 10", con);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        GMap1.Visible = true;
                        lblMsg.Visible = false;
                        while (dr.Read())
                        {
                            clinics.Add(new Clinic()
                            {
                                Id = Convert.ToInt32("" + dr["ClinicId"].ToString()),
                                Clinicname = dr["ClinicName"].ToString(),
                                lat = dr["Latitude"].ToString(),
                                longit = dr["Longitude"].ToString(),
                                contact = dr["Contact"].ToString(),
                                Address = dr["Address"].ToString()

                            });
                        }

                    }

                    PinIcon p;
                    GMarker gm;
                    GInfoWindow win;
                    foreach (var i in clinics)
                    {
                        p = new PinIcon(PinIcons.home, Color.Cyan);
                        gm = new GMarker(new GLatLng(Convert.ToDouble(i.lat), Convert.ToDouble(i.longit)),
                            new GMarkerOptions(new GIcon(p.ToString(), p.Shadow())));

                        win = new GInfoWindow(gm, i.Clinicname + " ," + i.Address + "", false, GListener.Event.mouseover);
                        GMap1.Add(win);
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Exception : " + ex.Message.ToString();
                GMap1.Visible = false;
                lblMsg.Visible = true;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnClick_Click(object sender, EventArgs e)
        {
            try
            {
                GMap1.reset();
                // Here I used Degha Location as Main Location and Lat Long is : 21.622564, 87.523417
                GLatLng mainLocation = new GLatLng(25.3876998, 68.363723);
                GMap1.setCenter(mainLocation, 15);

                XPinLetter xpinLetter = new XPinLetter(PinShapes.pin_star, "H", Color.Blue, Color.White, Color.Chocolate);
                GMap1.Add(new GMarker(mainLocation, new GMarkerOptions(new GIcon(xpinLetter.ToString(), xpinLetter.Shadow()))));

                List<Clinic> clinics = new List<Clinic>();

                con.Open();
                string query = @" SELECT   c.`ClinicId`, c.`ClinicName`, c.`Contact`, c.`Address`, c.`Latitude`,
                                                        c.`Longitude`, c.`IsActive`, c.`createddate`,
                                                        c.`createdby`, c.`updatedby`, c.`updateddate`
                                        FROM clinic c
                                        inner join `profile` p
                                        on c.`ClinicId`=p.`ClinicId`
                                        INNER JOIN `timetable` t
                                        ON t.`DoctorId`=p.`ProfileId`
                                        LEFT JOIN  `doctorservices` ds
                                        ON p.`ProfileId`=ds.`doctorid`
                                        LEFT JOIN `clinictype` dt
                                        ON ds.`clinictypeid`=dt.`ClinicTypeId` AND ds.`isactive`=1
                                        LEFT JOIN `tbldisease` d 
                                        ON ds.`clinictypeid`=d.`clinicserviceid`
                                        LEFT JOIN `symptoms` s 
                                        ON d.`diseaseid`=s.`diseaseid`
                                        where c.`IsActive`=1 AND 
                                            (c.`ClinicName` LIKE '%" + txtSearch.Text.ToString()
                                            + "%'   OR  c.`Contact` LIKE '%" + txtSearch.Text.ToString() + "%'   OR  c.`Address` LIKE '%" + txtSearch.Text.ToString()
                                            + "%' OR s.`symptom` LIKE '%" + txtSearch.Text.ToString() + "%'  OR d.`disease` LIKE '%" + txtSearch.Text.ToString() + "%' OR dt.`ClinicType` LIKE  '%" + txtSearch.Text.ToString() + "%' OR p.FirstName LIKE '%" + txtSearch.Text.ToString()
                                        + "%' OR p.LastName LIKE '%" + txtSearch.Text.ToString() + "%' " +
                                        " OR p.Email LIKE '%" + txtSearch.Text.ToString()
                                        + "%' OR p.Qualification LIKE '%" + txtSearch.Text.ToString()
                                        + "%' OR p.Specialization LIKE '%" + txtSearch.Text.ToString() + "%')   " +
                                        " GROUP BY c.`ClinicId` ";
                MySqlCommand cmd = new MySqlCommand(""+query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    GMap1.Visible = true;
                    lblMsg.Visible = false;
                    while (dr.Read())
                    {
                        clinics.Add(new Clinic()
                        {
                            Id = Convert.ToInt32("" + dr["ClinicId"].ToString()),
                            Clinicname = dr["ClinicName"].ToString(),
                            lat = dr["Latitude"].ToString(),
                            longit = dr["Longitude"].ToString(),
                            contact = dr["Contact"].ToString(),
                            Address = dr["Address"].ToString()

                        });
                    }

                }

                PinIcon p;
                GMarker gm;
                GInfoWindow win;
                foreach (var i in clinics)
                {
                    p = new PinIcon(PinIcons.home, Color.Cyan);
                    gm = new GMarker(new GLatLng(Convert.ToDouble(i.lat), Convert.ToDouble(i.longit)),
                        new GMarkerOptions(new GIcon(p.ToString(), p.Shadow())));

                    win = new GInfoWindow(gm, i.Clinicname + " ," + i.Address + "", false, GListener.Event.mouseover);
                    GMap1.Add(win);
                }
            
            }
            catch (Exception ex)
            {

                lblMsg.Text = "Exception : " + ex.Message.ToString();
                GMap1.Visible = false;
                lblMsg.Visible = true;
            }
            finally
            {
                con.Close();
            }

        }
    }
}