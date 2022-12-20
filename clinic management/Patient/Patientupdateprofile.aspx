<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="Patientupdateprofile.aspx.cs" Inherits="clinic_management.Patientupdateprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <style>
         
      .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
               padding-bottom:10%;
               margin-top:2%;
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
               
         }  

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                    <%-- Profile form Code--%>
    <center>
    	<div class="col-md-12 ">
		    
		        <div class=" offset-md-3 card col-md-6">
		            <div class="row">
		                <div class="col-md-10">
                            
		                    <%-- <img src="assets/img/person logo.png" class="img1" alt="">--%><h3 class="text-primary" style="margin-top:15px; padding-bottom:10px; margin-left:100px; font-weight:bold; text-decoration:underline">UPDATE PROFILE</h3>

		              
		             
                              <div class="offset-md-3 col-md-12">
                                <label for="firstname"   style="float:left; margin-left:40px; margin-top:30px; font-weight:bold;">First Name</label> 
                                <div>
                                  <input style="border-radius:10px; border: 2px solid gray;" id="firstname" name="firstname" placeholder="First Name" class="form-control here offset-md-5 col-md-8 rounded" required="required" type="text" runat="server">
                 <div style="margin-top:40px;">  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="firstname" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                 </div></div>  
                              </div>


                              <div class="offset-md-3 col-md-12">
                                <label for="lastname" class="offset-md-1" style="float:left; margin-top:30px;font-weight:bold">Last Name</label> 
                                <div>
                                  <input id="lastname" style=" border-radius:10px; border: 2px solid gray;" name="name" placeholder="Last Name" class="form-control here offset-md-5 col-md-8 rounded" type="text" runat="server">
                            <br />    <div style="margin-top:30px;">      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="lastname" runat="server" ErrorMessage="Numeric and special character are not allowed...!" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z ]{3,50}$"></asp:RegularExpressionValidator>
                                    </div></div>
                              </div>
                              <div class=" offset-md-3 col-md-12">
                                <label for="cnic" class="offset-md-1" style="float:left; margin-top:30px; font-weight:bold">CNIC</label> 
                                <div>
                               <input id="cnic" style=" border-radius:10px; border: 2px solid gray;" name="cnic" placeholder="CNIC" class="form-control here offset-md-5 col-md-8 rounded" type="text" runat="server">
                       <br />        <div style="margin-top:30px;"> <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="cnic" runat="server" ErrorMessage="Required Pattern: 12345-1234567-1" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"></asp:RegularExpressionValidator>
                                    </div></div>
                              </div>
                              <div class="offset-md-3 col-md-12">
                                <label for="text" class="offset-md-1"  style="float:left; margin-top:30px;font-weight:bold">Email</label> 
                                <div >
                                  <input id="email" style=" border-radius:10px; border: 2px solid gray;" name="email" placeholder="Email" class="form-control here offset-md-5 col-md-8 rounded" required="required" type="text" runat="server">
                        <br />      <div style="margin-top:30px;">        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="email" runat="server" ErrorMessage="Required Pattern: abc12@gmail.com" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                                    </div></div>
                              </div>
                             
                            
                              
                              <div class="offset-md-3 col-md-12">
                                <label for="contact" class="offset-md-1" style="float:left; margin-top:30px;font-weight:bold">Contact</label> 
                                <div>
                                  <input id="contact" style=" border-radius:10px; border: 2px solid gray;" name="contact" placeholder="Contact" class="form-control here offset-md-5 col-md-8 rounded" type="text" runat="server">
                         <div style="margin-top:30px;">        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="Contact" runat="server" ErrorMessage="Required Pattern: +92 OR 03456323456" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]{1}[9]{1}[2]{1}[0-9]{10}|^[0]{1}[0-9]{10}$"></asp:RegularExpressionValidator>
                                    </div></div>
                              </div>

                               
                              <div class=" offset-md-3 col-md-12">
                                <div class="offset-4 col-6">
                                  <button style="border-radius:10px; margin-top:20px;" name="submit" type="submit" class="btn btn-primary" onserverclick="btnClick_ServerClick" runat="server">UPDATE </button>
                                </div><br /><br />
                              </div>

                                 <div class="offset-md-3 col-md-12" >
                                <div class="offset-4 col-8">
                                  <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </div>
                              </div>
                            </form>
		                </div>
		            </div>
		            </div>
                </div>
          
      </center>


</asp:Content>
