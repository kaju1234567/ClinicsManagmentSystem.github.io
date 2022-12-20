<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="Patientwelcome.aspx.cs" Inherits="clinic_management.Patientwelcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
     .card{
    
     margin-bottom:15%;
  padding-bottom:7%;
    border-top-right-radius:30%; 
    border: 2px solid cadetblue; 
    background: linear-gradient(to right, white 10%,  cadetblue 90%); 
   
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         
    
                    <%-- Profile form Code--%>
   <div class=" col-md-12 ">
		    <div class="offset-md-4 card col-md-6" >
		            <div class="row">
		                <div class="col-md-10">
		                    <%-- <img src="assets/img/person logo.png" class="img1" >--%><h3 class="text-primary" style="margin-top:15px; font-weight:bold;text-decoration:underline" ><center>YOUR PROFILE</center></h3><br />
		                 </div> 
		            </div>
		            
		            <div class="col-md-12 " style="margin-top:20px;">
                                <label class="offset-md-2" for="firstname"   style="float:left;font-weight:bold">First Name</label>
                                  <div>
                                <asp:Label class="offset-md-3" ID="Label1" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br /> 
                              </div>
                              <div class="col-md-12 ">
                                <label class="offset-md-2" for="lastname"   style="float:left;font-weight:bold">Last Name</label> 
                                  <div>
                                      <div>
                                     
                               <asp:Label class="offset-md-3" ID="Label2" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                  </div>    </div><br />                               </div>
                              <div class="col-md-12 ">
                                <label class="offset-md-2" for="cnic"  style="float:left;font-weight:bold">CNIC</label> 
                                  <div>
                               <asp:Label class="offset-md-3" ID="Label3" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br /> 
                              </div>
                              <div class="col-md-12 ">
                                <label class="offset-md-2" for="text"  style="float:left;font-weight:bold">Email</label>
                                  <div>
                                <asp:Label class="offset-md-3" ID="Label4" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br /> 
                              </div>
                             
                             
                              <div class="col-md-12 ">
                                <label class="offset-md-2" for="contact"  style="float:left;font-weight:bold">Contact</label>
                                  <div>
                                <asp:Label class="offset-md-3" ID="Label5" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br /> 
                              </div>

                                
                              <div class="col-md-12 ">
                                <div class="offset-4 col-6">
                                  <button name="submit"  style="border-radius:10px;" class="btn btn-primary"><a style="color:white" href="Patientupdateprofile.aspx">Update Profile</a></button>
                                </div><br /> <br /> 
                              </div>
                           
		            </div>
            
          
     

</asp:Content>
