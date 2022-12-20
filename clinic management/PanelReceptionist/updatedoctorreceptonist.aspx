<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="updatedoctorreceptonist.aspx.cs" Inherits="clinic_management.updatedoctorreceptonist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
          #updatedoctor h3 {
              margin-top:5%; 
             padding-bottom:10px;
             font-weight:bold;
             text-decoration:underline;
            margin-left:24%;
         }
         .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
               padding-bottom:10%;
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
          
               
         }
         .form-control{
             border-radius:10px;
             border: 2px solid gray;
             margin-top:5px;
               
         }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    	<div class="col-md-12 "style="margin-left:30px;">
		    <div class="offset-md-4 card col-md-6 ">
    <div id="updatedoctor" class="text-primary">
           <h3>
               Update Doctor
           </h3>
  
		    <center>
		                    <form runat="server">
                              <div class="col-md-10">
                                <%--<label for="firstname" class="col-4 col-form-label">c</label>--%> 
                                <div>
                                  <input id="txtFirstname" name="firstname" placeholder="First Name" class="form-control here" style="margin-bottom:-18px;" required="required" type="text" runat="server"><br />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFirstname" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>

                            <div class="col-md-10">
                                <%--<label for="firstname" class="col-4 col-form-label">c</label>--%> 
                                <div>
                                  <input id="txtLastname" name="firstname" placeholder="Last Name" class="form-control here" style="margin-bottom:-18px;" required="required" type="text" runat="server"><br />
                               <br /> <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtLastname" runat="server" ErrorMessage="Numeric and special character are not allowed...!" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z ]{3,50}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>
                               
                                <div class="col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                <div>
                                  <input id="txtContact" name="contact" placeholder="Contact" class="form-control here" required="required" type="number" runat="server">
                            <br />    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtContact" runat="server" ErrorMessage="Required Pattern: +92 OR 03456323456" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]{1}[9]{1}[2]{1}[0-9]{10}|^[0]{1}[0-9]{10}$"></asp:RegularExpressionValidator>
                                    </div>
                              </div>

                              
                              <div class="col-md-10">
                                <%--<label for="text" class="col-4 col-form-label">Email</label> --%>
                                <div>
                                  <input id="txtAddress" name="email" placeholder="Address" class="form-control here" required="required" type="text" runat="server">
                                </div><br />
                              </div>

                                 <div class="col-md-10">
                                <%--<label for="text" class="col-4 col-form-label">Email</label> --%>
                                <div>
                                  <input id="txtcnic" name="email" placeholder="CNIC" class="form-control here" required="required" type="text" runat="server">
                               <br />  <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtCnic" runat="server" ErrorMessage="Required Pattern: 12345-1234567-1" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>
                             
                                <div class="col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div>
                                  <input id="txtEmail" name="username" placeholder="Email" class="form-control here" required="required" type="text" runat="server">
                              <br />  <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtEmail" runat="server" ErrorMessage="Required Pattern: abc12@gmail.com" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>
                                <div class="col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div>
                                  <input id="txtqualification" name="username" placeholder="Qualification" class="form-control here" required="required" type="text" runat="server">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtqualification" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>

                                  <div class="col-md-10">
                                  <div>
                                  <input id="txtspecialization" name="username" placeholder="Specialization" class="form-control here" required="required" type="text" runat="server">
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtspecialization" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                                    </div>
                              </div>
                                 <div class="col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div class=" text-left">
                                   <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                                 <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                                </div>
                              </div>
                              
                              <%--<div class="form-group row">
                                <div class="col-12">
                                  <input id="password" name="password" placeholder=" Password" class="form-control here" type="text">
                                </div>
                              </div> --%>
                              <div class="col-md-10">
                                <div class="offset-4 col-8 text-right">
                                  <button name="submit" id="btnupdateclinic"  class="btn btn-primary" onserverclick="btnupdateclinic_ServerClick" runat="server" >Update Doctor</button>
                                </div>
                              </div>
                               
                                <asp:Label ID="lblMsg" runat="server" style="color:red"></asp:Label>
                            </form>
		                </div>
		       
            </div>
        </div>
      </center>
    <h1></h1>

</asp:Content>

