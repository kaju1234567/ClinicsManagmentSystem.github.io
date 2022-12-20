<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateClinic.aspx.cs" Inherits="clinic_management.UpdateClinic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
       
         #updateclinic h3 {
              margin-top:5%; 
             padding-bottom:30px;
             font-weight:bold;
             text-decoration:underline;
         }
         .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
              
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
               
         }
         .form-control{
             border-radius:10px;
             border: 2px solid gray;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <center>
    	<div class="col-md-12 ">
		    <div class=" offset-md-2 card col-md-6">
		       
		          <div id="updateclinic" class="col-md-12 text-primary">
           <h3>
               UPDATE CLINIC
           </h3>
   </div>
		           
		                    <form runat="server">
                              <div class="col-md-10">
                                <%--<label for="firstname" class="col-4 col-form-label">c</label>--%> 
                                <div>
                                  <input id="txtclinicname" name="clinicname" placeholder="Clinic Name" class="form-control here" style="margin-bottom:-18px;" required="required" type="text" runat="server">
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtclinicname" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                    
                                    </div>
                              </div>
                                 <br />
                                <div class="col-md-10">
                               
                                      <asp:TextBox ID="txtc" placeholder="Contact *" CssClass="form-control" runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="Contact *" value="" --%>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                                  ControlToValidate="txtc" runat="server"
                                  ErrorMessage="Required Pattern: +92 OR 03456323456" Display="Dynamic"
                                  ForeColor="Red" ValidationExpression="^[+]{1}[9]{1}[2]{1}[0-9]{10}|^[0]{1}[0-9]{10}$">

                              </asp:RegularExpressionValidator>
                       
                                    <br />

                                    </div>
                             
                              
                              <div class="col-md-10">
                                <%--<label for="text" class="col-4 col-form-label">Email</label> --%>
                                <div>
                                  <input id="txtAddress" name="email" placeholder="Address" class="form-control here" required="required" type="text" runat="server">
                                </div>
                              </div>
                              <br />
                                <div class="col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div>
                                  <input id="txtLat" name="username" placeholder="Latitude" class="form-control here" required="required" type="text" runat="server">
                                </div>
                              </div>
                                 <br />
                                <div class="col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div>
                                  <input id="txtLong" name="username" placeholder="Longitude" class="form-control here" required="required" type="text" runat="server">
                                </div>
                              </div>
                                 <br />
                                 <div class="col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div class="text-left">
                                    <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                                 <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                                </div>
                              </div>
                              
                              <%--<div class="form-group row">
                                <div class="col-12">
                                  <input id="password" name="password" placeholder=" Password" class="form-control here" type="text">
                                </div>
                              </div> --%>
                                <br />
                              <div class="row">
                                <div class="offset-3 col-6 text-center">
                                  <button name="submit" id="btnupdateclinic"  class="btn btn-primary" onserverclick="btnupdateclinic_ServerClick" runat="server" >Update Clinic</button>
                                </div>
                              </div>
                                <br /><br />
                                <asp:Label ID="lblMsg" runat="server" style="color:red"></asp:Label>
                            </form>
		                </div>
		            </div>
		            </div>
                </div>
            </div>
      </center>
    <h1></h1>

</asp:Content>
