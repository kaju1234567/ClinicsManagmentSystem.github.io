<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Updatedisease.aspx.cs" Inherits="clinic_management.PanelReceptionist.Updatedisease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
       #updatedisease h3 {
              margin-top:5%; 
             padding-bottom:10px;
             font-weight:bold;
             text-decoration:underline;
         }
         .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
           padding-bottom:30px;
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
  
     <center>
    	<div class="col-md-12 ">
		    <div class="offset-md-3 card col-md-6">
		        <div class="card-body">
		             <div id="updatedisease" class="text-primary">
           <h3>
               Update Disease
           </h3>
  
		            
		                    <form runat="server">
                              <div class="col-md-10">
                                <%--<label for="firstname" class="col-4 col-form-label">c</label>--%> 
                                <div>
                                  <input id="txtDisease" name="txtDisease" placeholder="Disease" class="form-control here" style="margin-bottom:-18px;" required="required" type="text" runat="server"><br />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtDisease" runat="server" ErrorMessage="Mimimum 3 letter are allowed and numeric and specail character are not allowed without dot.!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                                </div>
                              </div>

                                <div class="col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div>
                                        <asp:DropDownList ID="ddlservices" class="form-control here" runat="server"></asp:DropDownList>
                                   </div>
                                    <br /><br />
                              </div>
                              <div class="col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div>
                                        <input id="txtDecription" name="contact" placeholder="Description" class="form-control here" required="required" type="text" runat="server">
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtDecription" runat="server" ErrorMessage="Mimimum 3 letter are allowed and numeric and specail character are not allowed without dot.!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                                 
                                     </div>
                                  <br />
                              </div>
                              
                                 <div class="col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div class=" text-left">
                                    <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                                 <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                                </div>
                                    
                              </div>
                              
                             
                              <div class="col-md-10">
                                <div class="offset-4 col-8 text-right">
                                  <button name="submit" id="btnsubmit"  class="btn btn-primary"  runat="server" onserverclick="btnsubmit_ServerClick" >Update Disease</button>
                                </div>
                                  <br />
                              </div>
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
