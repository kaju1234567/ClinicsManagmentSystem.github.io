<%@ Page Title="" Language="C#" MasterPageFile="~/homemaster.Master" AutoEventWireup="true" CodeBehind="homecontent.aspx.cs" Inherits="clinic_management.homecontent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="assets/css/boostrapnav.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <!-- ======= Hero Section ======= -->

    <section id="hero"  class="d-flex align-items-center">
    <div class="container">
     <h1>Welcome to clinic services</h1>
      <h2>Services for helping you and your loved ones</h2>
      <a href="#about" class="btn-get-started scrollto">Get Started</a>
    </div>
  </section>
     <!-- End Hero -->
    </asp:Content>
 
  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


  <main id="main">

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container" style="padding-left:100px;">

        <div class="row">
          <div class="col-lg-4 d-flex align-items-stretch">
            <div class="content" style="width:95%; height:400px;  border-radius:20px; margin-top:45px; margin-right:60px;">
              <h3>Why Choose AK's Services?</h3>
              <p>
             <h6>Efficient and Effective Processes</h6>  
               <h6> Easy to use</h6>  
                <h6>Time-Saving</h6>  
              </p>
             </div>
            
          </div>
          <div " class="col-lg-8 d-flex align-items-stretch">
            <div class="icon-boxes d-flex flex-column justify-content-center">
              <div class="row">
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-receipt"></i>
                    <h4>Health Records</h4>
                    <p> Patient health records.</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-cube-alt"></i>
                    <h4>Appointment Reminder</h4>
                    <p>Booking, rescheduling and cancellation of appointments reminder via email.</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-images"></i>
                    <h4>Patient Screening</h4>
                    <p>Uploading and viewing the reports</p>
                  </div>
                </div>
              </div>
            </div><!-- End .content-->
          </div>
        </div>

      </div>
    </section><!-- End Why Us Section -->

          <!-- ======= doctor profile details ======= -->
      <form runat="server">
      <section id="doctors" class="doctors">
      <div class="container">

        <div class="section-title">
          <h2>Doctors</h2><br />
          <p style="font-weight:bold; font-family:'Agency FB'; font-size:25px;">If You Feel Sick, Here Are The Services That Can Make You Back On Ones's Feet...! </p>
        </div>
          <br />
        <div class="  row">
            <div class="offset-md-5 col-md-6 align-content-center">
          
                <asp:Repeater ID="Repeater1" runat="server">
                   <ItemTemplate>
                       <div class="row col-md-10 border " style="margin-bottom:50px; border-radius:4%; padding-top:20px; background-color: lightblue">
                          
                           <div class="col-md-1  border-info mx-auto">
                               <asp:Image ImageUrl='<%# Eval("imgsource") %>' Width="130" Height="130"  runat="server"   CssClass="rounded-circle" />
                                 </div>

                           <div style="font-style:italic; " class="offset-1 col-md-6 text-primary  ">
                               <h5 style="margin-left:50px;"><%# Eval("FirstName") %></h5>
                               <h5 style="margin-left:50px;"><%# Eval("LastName") %></h5>
                               <h5 style="margin-left:50px;"><%# Eval("Qualification") %></h5>
                               <h5 style="margin-left:50px;"><%# Eval("Specialization") %></h5><br />
                           </div>
                            
                           <div class="row mx-auto" style="margin-top:10px; margin-bottom: 70px; font-style:italic;  ">
                               <div class="col-md-12  ">
                                   <a href="Patient/DoctorAppointment.aspx?doctorid=<%#Eval("ProfileId")%>" class="btn btn-primary">Request An Appointment</a>
                               </div>
                           </div>

                       </div>
                       
                       
                       
                    </ItemTemplate>
                </asp:Repeater>
       
         </div>
      

        </div>

      </div>
    </section>  
          <!-- ======= end of doctor profile details ======= -->
              <!-- ======= clinic details ======= -->
        <section id="departments" class="clinics">
      <div class="container">

        <div class="section-title">
          <h2>Clinics</h2>
            <br />
          <p style="font-weight:bold; font-family:'Agency FB'; font-size:25px;">Find Clinic Services Easily And Be Fit As A Fiddle...!</p>
        </div>
          <br />

        <div class="row">
            <div class=" offset-md-4 col-md-5">
          
                <asp:Repeater ID="Repeater2" runat="server">
                   <ItemTemplate>
                       <div class=" row  border  mx-auto" style=" padding-left:100px; margin-bottom:50px; border-radius:4%" >
                           
                           
                           <div class=" col-md-12  mx-auto bg-info border border-info " style="  text-align:center; border-top-left-radius:4%; border-top-right-radius:4%;  padding-top:20px; color:white; padding-bottom:20px;  font-style:italic" >
                               <h5  "><%# Eval("ClinicName") %></h5>
                               <h5 "><%# Eval("Contact") %></h5>
                               <h5 "><%# Eval("Address") %></h5>
                          
                           </div>
                           <div class="row mx-auto" style="margin-top:20px; margin-bottom: 50px; font-style:italic;  ">
                               <div class="col-md-12 "  >
                                   <a href="DetailClinic.aspx?ClinicId=<%#Eval("ClinicId")%>" class="btn btn-primary " style="border-radius:30%; width: 120%" >Details</a>
                               </div>
                           </div>

                           </div>
                       
                       
                       
                    </ItemTemplate>
                </asp:Repeater>
      
         </div>
      

        </div>

      </div>
    </section>
              <!-- ======= end of clinic details ======= -->

           <!-- ======= start of aboutus details ======= -->

           <section id="aboutus" class="aboutus">
      <div class="container">
        <div class="section-title">
          <h2>AboutUs</h2>
        </div>
         
          <div class="row">
            <div class=" col-12 mx-auto">
                
              <center>   <p style="font-weight:bold; font-family:'Agency FB'; font-size:22px;" class=" offset-3 col-6 text-center">Visit The Site To Get Rid Of Your Illness Condition Problems And Find Services Regarding It And Become Alive And Kicking...!</p></center>
                <br />
                <div class=" offset-3 row">
                <div class=" col-12 mx-auto" style="height:500px; background-color:cadetblue; border-radius:50px;">
                    <ul style="list-style:none">
                        <li style="color:white;  padding-top:50px;  padding-left:40px; font-size:20px;"><i style=" font-size:50px;" class="fa fa-search "></i>	&nbsp;	&nbsp; Search for clinics and doctors by clinic name, doctor name, service, disease or symptoms.</li>
                        <li style="color:white;  padding-top:50px;  padding-left:40px; font-size:20px;"><i style=" font-size:50px;" class="fa fa-medkit "></i>	&nbsp;	&nbsp; Book an appointment easily in a minutes.</li>
                       <li style="color:white; padding-top:50px;  padding-left:40px; font-size:20px;"><i style=" font-size:50px;" class="fa fa-upload"></i>	&nbsp;	&nbsp; Patients can have the oportunity to upload the reports of test, keep it for feature and view to doctor.</li>
                         <li style="color:white; padding-top:50px; padding-left:40px; font-size:20px;"><i style=" font-size:50px;" class="fa fa-file-o"></i>	&nbsp;	&nbsp; Doctors can view the file of patient test and its history.</li>
                    </ul>
                </div>
                </div><br /><br />
              </div></div>
      </div>
    </section>


           </form>

 
  </main><!-- End #main -->

    <div id="preloader"></div>
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="assets/vendor/counterup/counterup.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
</asp:Content>
