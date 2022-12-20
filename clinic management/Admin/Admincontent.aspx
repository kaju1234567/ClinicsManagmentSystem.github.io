<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admincontent.aspx.cs" Inherits="clinic_management.Admincontent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
     .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
           
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
               
         }  


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


         
    
                    <%-- Profile form Code--%>
 
    	<div class=" offset-2 col-md-12 ">
		    <div class=" card col-md-6"  style="margin-left:25%">
		            <div class=" offset-md-1 row">
		                <div class=" col-md-10">
                            
		                    <%-- <img src="assets/img/person logo.png" class="img1" alt="">--%><h3 style="  margin-top:5%; font-weight:bold; text-decoration:underline" class="text-primary offset-md-4" >YOUR PROFILE</h3>

		              
		                </div><br /><br />   
		            </div>
		            
		                  
                              <div class="col-md-10 " style="margin-top:30px;">
                                <label class="offset-md-3" for="firstname" style="float:left; font-weight:bold">First Name</label>
                                  <div>
                                <asp:Label class="offset-md-4" ID="Label1" runat="server" style=" font-weight:bold; " ></asp:Label>
                                     </div>  <br />  
                              
                            </div>
                                 <div class="col-md-10 ">
                                <label class="offset-md-3" for="lastname" style="float:left; font-weight:bold;" >Last Name</label> 
                                  <div>
                               <asp:Label class="offset-md-4" ID="Label2" style=" font-weight:bold" runat="server" ></asp:Label>
                                      
                              </div><br />  
                                </div>
                              <div  class="col-md-10 ">
                                <label class="offset-md-3" for="cnic" style="float:left; font-weight:bold">CNIC</label> 
                                  <div>
                               <asp:Label class="offset-md-4" ID="Label3" runat="server"  style=" font-weight:bold" ></asp:Label>
                                      </div><br />  
                              </div>
                              <div  class="col-md-10 " >
                                <label class="offset-md-3" for="text"  style="float:left; font-weight:bold">Email</label>
                                  <div>
                                <asp:Label class="offset-md-4" ID="Label4" runat="server" style=" font-weight:bold" ></asp:Label>
                                      </div><br />  
                              </div>
                             
                             
                              <div  class="col-md-10 ">
                                <label class="offset-md-3" for="contact" style="float:left; font-weight:bold" >Contact</label>
                                  <div>
                                <asp:Label class="offset-md-4" ID="Label5" runat="server"  style=" font-weight:bold"></asp:Label>
                                      </div><br /> 
                              </div>

                                 <div  class="col-md-10 ">
                                <label class="offset-md-3" for="address" style="float:left; font-weight:bold;" >Address</label>
                                  <div>
                                <asp:Label class="offset-md-4" ID="Label6" runat="server" style=" font-weight:bold" ></asp:Label>
                                      </div><br /> 
                              </div>

                              
                              <div class="col-md-12" style="padding-bottom:40px;">
                                <div class="col-6 offset-4">
                                  <button name="submit"  class="btn  btn-primary" ><a style="color:white; font-weight:bold"  href="Adminupdateprofile.aspx">UPDATE PROFILE</a></button>
                                </div>   
                              </div>
                <br /><br />
		                </div>
		            </div>
		            
        
</asp:Content>
