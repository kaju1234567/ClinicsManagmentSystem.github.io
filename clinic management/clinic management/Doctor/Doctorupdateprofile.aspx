<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="Doctorupdateprofile.aspx.cs" Inherits="clinic_management.Doctorupdateprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
    .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
             
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
               padding-bottom:7%;
               
         }  

   
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div id="doctorpanel">
         
   </div>
         
    
                    <%-- Profile form Code--%>
    <center>
    	<div class="col-md-12 ">
		    
		        <div class="offset-3 card col-md-6">
		            <div class="offset-2 row">
		                <div class="col-md-10">
                            
		                    <%-- <img src="assets/img/person logo.png" class="img1" alt="">--%><h3 class="text-primary" style=" font-weight:bold; margin-top:20px; text-decoration:underline">UPDATE PROFILE</h3>

		              
		                </div>
		            </div><br />
		           
                            <div class="offset-2 col-md-12">
                                <label for="firstname"  style="float:left; margin-top:34px; font-weight:bold;">First Name</label> 
                                <div>
                                  <input style="margin-bottom:-18px; border-radius:10px; border: 2px solid gray;" id="firstname" name="firstname" placeholder="First Name" class="form-control here offset-md-4 col-md-7 rounded" required="required" type="text" runat="server">
                       <div style="margin-top:7%"><asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="firstname"  runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                   </div></div>
                              </div>
                              <div class="offset-2 col-md-12">
                                <label for="lastname"  style="float:left; margin-top:34px;font-weight:bold;">Last Name</label> 
                                <div >
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="lastname" name="name" placeholder="Last Name" class="form-control here offset-md-4 col-md-7 rounded" type="text" runat="server">
                           <div style="margin-top:8%"><asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="lastname" runat="server" ErrorMessage="Numeric and special character are not allowed...!" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z ]{3,50}$"></asp:RegularExpressionValidator>
                                    </div></div>
                              </div>
                              <div class=" offset-2 col-md-12">
                                <label for="cnic"  style="float:left;font-weight:bold; margin-top:30px;">CNIC</label> 
                                <div>
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="cnic" name="cnic" placeholder="CNIC" class="form-control here offset-md-4 col-md-7 rounded" type="text" runat="server">
                             <div style="margin-top:8%"><asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="cnic" runat="server" ErrorMessage="Required Pattern: 12345-1234567-1" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"></asp:RegularExpressionValidator>
                                    </div></div>
                              </div>
                              <div class=" offset-2 col-md-12">
                                <label for="text"  style="float:left;font-weight:bold;margin-top:34px;">Email</label> 
                                <div>
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="email" name="email" placeholder="Email" class="form-control here offset-md-4 col-md-7 rounded" required="required" type="text" runat="server">
            <div style="margin-top:8%"> <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="email" runat="server" ErrorMessage="Required Pattern: abc12@gmail.com" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                                    </div></div>
                              </div>
                             
                              
                              <div class=" offset-2 col-md-12">
                                <label for="contact"  style="float:left;font-weight:bold;margin-top:34px;">Contact</label> 
                                <div>
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="contact" name="contact" placeholder="Contact" class="form-control here offset-md-4 col-md-7 rounded" type="text" runat="server">
                                 <div style="margin-top:8%"> <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="Contact" runat="server" ErrorMessage="Required Pattern: +92 OR 03456323456" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]{1}[9]{1}[2]{1}[0-9]{10}|^[0]{1}[0-9]{10}$"></asp:RegularExpressionValidator>
                                    </div></div>
                              </div>
                                
                                <div class=" offset-2 col-md-12">
                                <label for="qualification"  style="float:left;font-weight:bold; margin-top:34px;">Qualification</label> 
                                <div>
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="qualification" name="qualification" placeholder="Qualification" class="form-control here offset-md-4 col-md-7 rounded" type="text" runat="server">
                                    <div style="margin-top:4%"><asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="qualification"  runat="server" ErrorMessage=" Numeric and special character are not allowed without dot...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                   </div>
                                </div>
                              </div>

                                <div class="offset-2 col-md-12">
                                <label for="specialization"  style="float:left;font-weight:bold;margin-top:35px;">Specialization</label> 
                                <div >
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="specialization" name="specialization" placeholder="Specialization" class="form-control here offset-md-4 col-md-7 rounded" type="text" runat="server">
                                 <div style="margin-top:5%"><asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="specialization"  runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                   </div>
                                </div>
                              </div>

                               
                              <div class="offset-2 col-md-12">
                                <div class="offset-md-3 col-md-8">
                                  <button name="submit" type="submit" class="btn btn-primary" onserverclick="btnClick_ServerClick" runat="server">Update</button>
                                </div><br />
                              </div>

                                <div class="offset-2 col-md-12">
                                <div class="offset-md-4 col-md-6">
                                  <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </div>
                              </div>
                          
		            </div>
                </div>
        
      </center>

</asp:Content>
