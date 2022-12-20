<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="receptionistwelcome.aspx.cs" Inherits="clinic_management.receptionistwelcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

.card{
         margin-bottom:5%;
         margin-left:50px;
    border-top-right-radius:25%; 
    border: 2px solid cadetblue; 
    background: linear-gradient(to right, white 10%,  cadetblue 90%); 
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     

 
         
    
                    <%-- Profile form Code--%>
   <div class="offset-md-4  col-md-11 ">
		    <div class="card col-md-7"  >
		            <div class="row">
		                <div class="col-md-10">
                            
		                     <%--<img src="assets/img/person logo.png" class="img1" alt="">--%><h3 style="color:blue; margin-top:3%; font-weight:bold;text-decoration:underline" class="text-primary offset-md-5">YOUR PROFILE</h3>

		                
		                </div>
		            </div><br /><br /> 
		           
		                
                              <div class="col-md-12" style="margin-top:10px;">
                                <label class="offset-md-2" for="firstname"  style="font-weight:bold;float:left;">First Name</label>
                                  <div>
                                <asp:Label class="offset-md-3" ID="Label1" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div>
                              </div><br />
                              <div class="col-md-12 ">
                                <label class="offset-md-2" for="lastname" style="font-weight:bold;float:left;">Last Name</label> 
                                  <div>
                               <asp:Label class="offset-md-3" ID="Label2" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div>
                              </div><br />
                              <div class="col-md-12 ">
                                <label class="offset-md-2" for="cnic" style="font-weight:bold;float:left;">CNIC</label> 
                                  <div>
                               <asp:Label class="offset-md-3" ID="Label3" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div>
                              </div><br />                             
                <div class="col-md-12 ">
                                <label class="offset-md-2" for="text"  style="font-weight:bold;float:left;">Email</label>
                                  <div>
                                <asp:Label class="offset-md-3" ID="Label4" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div>
                              </div>
                             <br />
                             
                              <div class="col-md-12 ">
                                <label class="offset-md-2" for="contact" style="font-weight:bold;float:left;">Contact</label>
                                  <div>
                                <asp:Label class="offset-md-3" ID="Label5" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div>
                              </div><br />

                                  <div class="col-md-12 ">
                                <label class="offset-md-2" for="address"  style="font-weight:bold;float:left;">Address</label>
                                  <div>
                                <asp:Label class="offset-md-3" ID="Label6" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div>
                              </div>
                <br />
                                 <div class="col-md-12 ">
                                <label class="offset-md-2" for="contact"  style="font-weight:bold;float:left;">Qualification</label>
                                  <div>
                                <asp:Label class="offset-md-3" ID="Label7" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div>
                              </div>
                <br />
                                 <div class="col-md-12 ">
                                <label class="offset-md-2" for="contact"  style="font-weight:bold;float:left;">Specialization</label>
                                  <div>
                                <asp:Label class="offset-md-3" ID="Label8" runat="server" Text="Label" style="font-weight:bold"></asp:Label>
                                      </div>
                              </div>

                <br />
                                
                              <div class="offset-md-2 col-md-12 ">
                                <div class="offset-4 col-6">
                                <button name="submit" class="btn btn-primary" runat="server"><a style="color:white; padding-bottom:100px;"   href="Receptionistupdateprofile.aspx">Update Profile</a></button>
                                </div>
                              </div>
                        <br /><br /> <br /><br />
		                </div>
		            </div>
		          
     

</asp:Content>
