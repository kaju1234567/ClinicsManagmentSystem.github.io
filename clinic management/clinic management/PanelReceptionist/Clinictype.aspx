<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Clinictype.aspx.cs" Inherits="clinic_management.PanelReceptionist.Clinictype" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
     .card{
            border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:20%; 
               margin-top:4%;
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:40%;
 
}
  #addclinicservice h3{
             margin-top:5%; 
             padding-bottom:10px;
             font-weight:bold;
             text-decoration:underline;
             margin-left:25%;
         }
   .form-control{
             border-radius:10px;
             border: 2px solid gray;
         }
  
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     
    	<div class="offset-md-4 col-md-5 ">
		    <div class=" card">
		     
		           <div id="addclinicservice" class="text-primary">
           <h3>
               CLINIC SERVICE
           </h3>
                      

		           
		                    <form runat="server">
                              <div class="offset-md-2 col-md-10">
                                <%--<label for="firstname" class="col-4 col-form-label">c</label>--%> 
                                <div>
                                  <input id="txtClinictype" name="Clinictype" placeholder="Clinic Type" class="form-control here" style="margin-bottom:-18px;margin-top:4%" required="required" type="text" runat="server"><br />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtClinictype" runat="server" ErrorMessage="Special Character and numeric are not allowed....." ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                                </div>
                              </div><br />
                                <div class="offset-md-2 col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                <div>
                                  <input id="txtDecription" name="Description" placeholder="Description" class="form-control here" required="required" type="text" runat="server">
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtDecription" runat="server" ErrorMessage="Special Character and numeric are not allowed....." ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                              
                                  </div>
                              </div>
                              <br />
                                 <div class=" offset-md-2 col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div class=" text-left">
                                    <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                                 <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                                </div>
                              </div>
                              <br />
                             
                              <div class="offset-md-6 col-md-10">
                             
                                  <button name="submit" id="btnsubmit"  class="btn btn-primary" onserverclick="btnsubmit_ServerClick" runat="server" >Add SERVICE</button>
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
