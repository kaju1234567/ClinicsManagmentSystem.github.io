<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Receptionistupdateprofile.aspx.cs" Inherits="clinic_management.Receptionistupdateprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
         
      .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
               margin-top:2%;
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
               margin-left:50px;
               
         }  

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
   
    
                    <%-- Profile form Code--%>                  
    <center>
    	<div class="offset-md-1 col-md-12 ">
		    
		        <div class="card col-md-7">
		            <div class="row">
		                <div class="col-md-10">
                            
		                     <%--<img src="assets/img/person logo.png" class="img1" alt="">--%><h3 style="color:blue; margin-top:25px;   margin-left:100px; padding-bottom:30px; font-weight:bold; text-decoration:underline">UPDATE PROFILE</h3>

		              
		                </div>
		            </div>
		           
                              <div class="col-md-12">
                                <label for="firstname" class="offset-md-1" style="float:left;font-weight:bold; margin-top:35px;">First Name</label> 
                                <div >
                                  <input  style="margin-bottom:-18px; border-radius:10px; border: 2px solid gray;" id="firstname" name="firstname" placeholder="First Name" runat="server"  class="form-control here offset-md-4 col-md-7 rounded" required="required" type="text">
            <br />  <br />          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="firstname" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                    </div></div>
                             
                   
                              <div class="col-md-12">
                                <label for="lastname" class="offset-md-1" style="float:left;font-weight:bold; margin-top:35px;">Last Name</label> 
                                <div >
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="lastname" name="name" runat="server"  placeholder="Last Name" class="form-control here offset-md-4 col-md-7 rounded" type="text">
                        <br />  <br />        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="lastname" runat="server" ErrorMessage="Numeric and special character are not allowed...!" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z ]{3,50}$"></asp:RegularExpressionValidator>
                                    </div>
                              </div>
                    
                              <div class="col-md-12">
                                <label for="cnic" class="offset-md-1" style="float:left;font-weight:bold;margin-top:35px;">CNIC</label> 
                                <div>
                                 <input style=" border-radius:10px; border: 2px solid gray;" id="cnic" name="cnic" runat="server"  placeholder="CNIC" class="form-control here offset-md-4 col-md-7 rounded" type="text">
                            <br />  <br />     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="cnic" runat="server" ErrorMessage="Required Pattern: 12345-1234567-1" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>
                  
                              <div class="col-md-12">
                                <label for="text" class="offset-md-1" style="float:left;font-weight:bold;margin-top:35px;">Email</label> 
                                <div>
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="email" name="email" runat="server"  placeholder="Email" class="form-control here offset-md-4 col-md-7 rounded" required="required" type="text">
                            <br />  <br />    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="email" runat="server" ErrorMessage="Required Pattern: abc12@gmail.com" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>
                           
                              
                              <div class="col-md-12">
                                <label for="contact" class="offset-md-1" style="float:left;font-weight:bold;margin-top:35px;">Contact</label> 
                                <div >
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="contact" name="contact"  runat="server" placeholder="Contact" class="form-control here offset-md-4 col-md-7 rounded" type="text">
                             <br />  <br />   <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="Contact" runat="server" ErrorMessage="Required Pattern: +92 OR 03456323456" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]{1}[9]{1}[2]{1}[0-9]{10}|^[0]{1}[0-9]{10}$"></asp:RegularExpressionValidator>
                                    </div>
                              </div>
                     <div class="col-md-12">
                                <label for="address" class="offset-md-1" style="float:left;font-weight:bold;margin-top:35px;">Address</label> 
                                <div>
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="address" name="address"  runat="server" placeholder="Address" class="form-control here offset-md-4 col-md-7 rounded" type="text">
                                    </div>
                              </div> <br />
                   
                                 <div class="col-md-12">
                                <label for="qualification" class="offset-md-1" style="float:left;font-weight:bold;margin-top:35px;">Qualification</label> 
                                <div >
                                  <input style=" border-radius:10px; border: 2px solid gray;" id="qualification" name="qualification"  runat="server" placeholder="Qualification" class="form-control here offset-md-4 col-md-7 rounded" type="text" ><br /><br />
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="qualification" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                   
                                    </div>
                              </div>
                   
                                <div class="col-md-12">
                                <label for="specialization" class="offset-md-1" style="float:left;font-weight:bold;margin-top:35px;">Specialization</label> 
                                <div >
                                  <input style=" border-radius:10px; border: 2px solid gray; " id="Specialization" name="specialization" runat="server"  placeholder="Specialization" class="form-control here offset-md-4 col-md-7 rounded" type="text" ><br /><br />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="Specialization" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                   
                                </div>
                              </div>
                             
                              <div class="col-md-12">
                                <div class="offset-4 col-8">
                                  <button style="border-radius:10px; margin-top:20px;" name="submit" type="submit" class="btn btn-primary" onserverclick="btnClick_ServerClick" runat="server">Update Profile</button>
                                </div>
                              </div>

                                  <div class="col-md-12">
                                <div class="offset-4 col-6">
                                  <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </div>
                              </div>
                           <br /><br /><br /><br />
		            </div>
                </div>
         
      </center>
        </form>
</asp:Content>
