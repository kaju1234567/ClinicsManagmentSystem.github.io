<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="doctorwelcome.aspx.cs" Inherits="clinic_management.doctorwelcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
        .card{
   
     margin-bottom:10%;
     padding-bottom:8%;
    border-top-right-radius:30%; 
    border: 2px solid cadetblue; 
    background: linear-gradient(to right, white 10%,  cadetblue 90%); 
   
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    
                    <%-- Profile form Code--%>
   <center>
    	<div class="offset-md-1 col-md-12 ">
		    <div class="card col-md-6"  >
		            <div class="row">
		                <div class="col-md-10">
                            
		                     <img src="E:/final project 7A/cms14/clinic management/clinic management/images/od form.png" id="imgProfile" class="img1 rounded-circle" alt="" runat="server"><h3 class="text-primary" style="  margin-top:1px; font-weight:bold; margin-left:27%; text-decoration:underline">YOUR PROFILE</h3>
         
		                </div>
		            </div><br />
		           
                              <div class="col-md-12 " style="margin-top:20px;">
                                <label for="firstname"  class="offset-md-2" style="float:left;font-weight:bold">First Name</label>
                                  <div>
                                <asp:Label ID="Label1" class="offset-md-3" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br />
                              </div>
                              <div class="col-md-12 ">
                                <label for="lastname" class="offset-md-2" style="float:left;font-weight:bold">Last Name</label> 
                                  <div>
                               <asp:Label ID="Label2" class="offset-md-3" runat="server" Text="Label" style="font-weight:bold; "></asp:Label>
                                      </div><br />
                              </div>
                              <div class="col-md-12 ">
                                <label for="cnic" class="offset-md-2" style="float:left;font-weight:bold">CNIC</label> 
                                  <div>
                               <asp:Label ID="Label3" class="offset-md-3" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br />
                              </div>
                              <div class="col-md-12 ">
                                <label for="text"  class="offset-md-2" style="float:left;font-weight:bold">Email</label>
                                  <div>
                                <asp:Label ID="Label4" class="offset-md-3" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br />
                              </div>
                             
                             
                              <div class="col-md-12 ">
                                <label for="contact" class="offset-md-2" style="float:left;font-weight:bold">Contact</label>
                                  <div>
                                <asp:Label ID="Label5" class="offset-md-3" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br />
                              </div>

                                 <div class="col-md-12 ">
                                <label for="contact" class="offset-md-2" style="float:left;font-weight:bold">Qualification</label>
                                  <div>
                                <asp:Label ID="Label6" class="offset-md-3" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br />
                              </div>

                                 <div class="col-md-12 ">
                                <label for="contact" class="offset-md-2" style="float:left;font-weight:bold">Specialization</label>
                                  <div>
                                <asp:Label ID="Label7" class="offset-md-3" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div><br />
                              </div>
               
                                
                              <div class="col-md-12 ">
                                <div class="offset-md-3 col-md-6">
                                  <button name="submit" style="border-radius:10px;" class="btn btn-primary"><a style="color:white" href="doctorupdateprofile.aspx">Update Profile</a></button>
                                </div>
                              </div>
                          
		            </div>
                </div>
    
      </center>

</asp:Content>
