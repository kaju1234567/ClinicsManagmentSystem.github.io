<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Adminupdateprofile.aspx.cs" Inherits="clinic_management.Adminupdateprofile" %>
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
    <center>
    	<div class= "col-md-12">
		    <div class="offset-md-4 card col-md-6">
		            <div class="offset-md-2 row">
		                <div class="col-md-10">
                            
		                    <%-- <img src="assets/img/person logo.png" class="img1" alt="">--%><h3 class="text-primary" style="  margin-top:10px; padding-bottom:30px; font-weight:bold; text-decoration:underline">UPDATE PROFILE</h3>

		              
		                </div>
		            </div>
		          
		                    <form runat="server">

                              <div class="col-md-12">
                                <label class="offset-md-1" for="firstname" style="float:left; font-weight:bold; margin-top:35px;">First Name</label>
                                <div >
                                  <input style="border: 1px solid gray" id="firstname" name="firstname" placeholder="First Name" runat="server" class="form-control here offset-md-4 col-md-7 rounded" required="required" type="text"><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="firstname" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <label class="offset-md-1" for="lastname" style="float:left; font-weight:bold; margin-top:35px;">Last Name</label> 
                                <div>
                                  <input style="border: 1px solid gray" id="txtlastname"  name="name" placeholder="Last Name" runat="server" class="form-control here offset-md-4 col-md-7" type="text"><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtlastname" runat="server" ErrorMessage="Numeric and special character are not allowed...!" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z ]{3,50}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>
                                <br />
                              <div class="col-md-12">
                                <label class="offset-md-1" for="cnic" style="float:left; font-weight:bold; margin-top:35px;" >CNIC</label> 
                                <div>
                                  <input  style="border: 1px solid gray" id="txtcnic"  name="cnic" placeholder="CNIC" class="form-control here offset-md-4 col-md-7" runat="server" type="text"><br />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtcnic" runat="server" ErrorMessage="Required Pattern: 12345-1234567-1" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>
                                <br />
                              <div class="col-md-12">
                                <label  class="offset-md-1" for="text" style="float:left; font-weight:bold; margin-top:35px;">Email</label> 
                                <div>
                                  <input style="border: 1px solid gray" id="txtemail"  name="email" placeholder="Email" class="form-control here offset-md-4 col-md-7" runat="server" required="required" type="text"><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtemail" runat="server" ErrorMessage="Required Pattern: abc12@gmail.com" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z.]{3,}[0-9]{0,}@[A-Za-z.]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                                    </div>
                              </div>
                             <br />
                              <%--<div class="form-group row">
                                <label for="email" class="col-4 col-form-label">Gender</label> 
                                <div class="col-8">
                                  <asp:DropDownList ID="ddlGender" class="form-control" runat="server">
                                     <asp:ListItem>-- Select Gender --</asp:ListItem>
                                     <asp:ListItem>Male</asp:ListItem>
                                     <asp:ListItem>Female</asp:ListItem>
                                     <asp:ListItem>Other</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                              </div>--%>
                              <div class="col-md-12">
                                <label class="offset-md-1" for="contact"  style="float:left; font-weight:bold; margin-top:35px;" >Contact</label> 
                                <div>
                                  <input style="border: 1px solid gray" id="txtContact"  name="contact" placeholder="Contact" class="form-control here offset-md-4 col-md-7" type="text" runat="server"><br />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtContact" runat="server" ErrorMessage="Required Pattern: +92 OR 03456323456" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]{1}[9]{1}[2]{1}[0-9]{10}|^[0]{1}[0-9]{10}$"></asp:RegularExpressionValidator>
                                    </div>
                              </div>
                                <br />
                               <div class="col-md-12">
                                <label class="offset-md-1" for="username" style="float:left; font-weight:bold; margin-top:35px;">Address</label> 
                                <div>
                                  <input style="border: 1px solid gray" id="txtAddress"  name="" placeholder="Address" class="form-control here offset-md-4 col-md-7" type="text" runat="server"><br />
                                </div>
                              </div>
                              <br />
                            
                              <div class="col-md-12" style="padding-bottom:60px;">
                                <div class="offset-4 col-4">
                                  <button id="btnClick" name="submit" type="submit" class="btn btn-primary" onserverclick="btnClick_ServerClick" runat="server">UPDATE</button>
                                </div>
                              </div>
                              <br />
                                <div class="col-md-12">
                                <div class="offset-4 col-6">
                                  <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </div>
                              </div>

                            </form>
		                </div>
                </div>
      </center>

</asp:Content>
