<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Updateclinictype.aspx.cs" Inherits="clinic_management.PanelReceptionist.Updateclinictype" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
       #updatecs h3 {
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
               margin-top:5%;
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
               padding-bottom:10%;
               
         }
         .form-control{
             border-radius:10px;
             border: 2px solid gray;
             margin-top:5px;
               
         }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
     <center>
    	<div class="offset-md-1 col-md-12 ">
		    <div class="card col-md-6">
		       <div id="updatecs" class="text-primary">
           <h3>
               Update Clinic Service 
           </h3>
   </div>
		        
		                    <form runat="server">
                              <div class="col-md-10">
                                <%--<label for="firstname" class="col-4 col-form-label">c</label>--%> 
                                <div>
                                  <input id="txtClinictype" name="Clinictype" placeholder="Clinic Type" class="form-control here" required="required" style="margin-bottom:-18px;" type="text" runat="server"><br />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtClinictype" runat="server" ErrorMessage="Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>
                                <br />
                                <div class="col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                <div>
                                  <input id="txtDecription" name="contact" placeholder="Description" class="form-control here" required="required" type="text" runat="server"><br />
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtDecription" runat="server" ErrorMessage="Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                               
                               </div>
                              </div>
                              <br />
                                 <div class="col-md-10 text-left">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div>
                                    <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                                 <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                                </div>
                              </div>
                              
                             <br />
                              <div class="col-md-10">
                                <div class="offset-md-2 col-8">
                                  <button name="submit" id="btnsubmit"  class="btn btn-primary"  runat="server" onserverclick="btnsubmit_ServerClick">Update Clinic Service</button>
                                </div>
                              </div><br />
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
