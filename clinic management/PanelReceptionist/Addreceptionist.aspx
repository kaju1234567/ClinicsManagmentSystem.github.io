<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Addreceptionist.aspx.cs" Inherits="clinic_management.PanelReceptionist.Addreceptionist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

         <style>
                    
       
         /*--------------------------------------------------------------
# forms
--------------------------------------------------------------*/

.card{
  border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
        margin-bottom:10%;
              
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:23%;
             
                 height:1200px;
}             

  #addreceptionist h3{
             margin-top:2%; 
             padding-bottom:10px;
             font-weight:bold;
             text-decoration:underline;
         }
   .form-control{
             border-radius:10px;
             border: 2px solid gray;
           
         }
  
 
     </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

<center>
    
 <div class="col-md-12"">
		    <div class="offset-md-3 card col-md-7  ">
		           <div id="addreceptionist"  class="col-md-12 text-primary">
           <h3 >
               ADD RECEPTIONIST
           </h3>
 
                    <form runat="server" >
                        <div class="col-md-10">
                            <asp:TextBox ID="txtFirstname" class="form-control " placeholder="First Name *" style="margin-bottom:-20px;margin-left:60px; " runat="server"></asp:TextBox><br />
                           <%-- <input id="Firstname" name="Firstname" placeholder="Firstname" class="form-control here" required="required" type="text" runat="server">--%>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFirstname" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                        </div><br />
                        <div class="col-md-10">
                            <asp:TextBox ID="txtLastname" class="form-control" placeholder="Last Name *" style="margin-left:60px; " runat="server"></asp:TextBox><br />
                           <%-- <input id="lastname" name="name" runat="server"  placeholder="Last Name" class="form-control here" type="text">--%>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtLastname" runat="server" ErrorMessage="Numeric and special character are not allowed...!" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z ]{3,50}$"></asp:RegularExpressionValidator>
                        </div><br />
                        <div class="col-md-10">
                            <asp:TextBox ID="txtCnic" class="form-control" placeholder="CNIC *" style="margin-left:60px; " runat="server"></asp:TextBox><br />
                              <%--<input id="cnic" name="cnic" runat="server"  placeholder="CNIC" class="form-control here" type="text">--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtCnic" runat="server" ErrorMessage="Required Pattern: 12345-1234567-1" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"></asp:RegularExpressionValidator>
                        </div><br />                         <div class="col-md-10" style="margin-left:120px; ">
                             <asp:DropDownList ID="ddlGender" class="form-control" runat="server">
                                 <asp:ListItem>-- Select Gender --</asp:ListItem>
                                 <asp:ListItem>Male</asp:ListItem>
                                 <asp:ListItem>Female</asp:ListItem>
                                 <asp:ListItem>Other</asp:ListItem>
                             </asp:DropDownList>
                        </div><br /><br />

                         <div class="col-md-10">
                             <asp:TextBox ID="txtContact" class="form-control" placeholder="Contact *"  style="margin-left:60px;" runat="server"></asp:TextBox><br />
                            <%--<input type="password" class="form-control" placeholder="Contact *" value="" --%>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtContact" runat="server" ErrorMessage="Required Pattern: +92 OR 03456323456" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]{1}[9]{1}[2]{1}[0-9]{10}|^[0]{1}[0-9]{10}$"></asp:RegularExpressionValidator>
                        </div><br />                
                        
                      <%--  <div class="col-md-10">
                             <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email *" style="margin-left:60px;" runat="server"></asp:TextBox><br />
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtEmail" runat="server" ErrorMessage="Required Pattern: abc12@gmail.com" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                        </div><br />  --%>        
                        
                        <div class="col-md-10">
                             <asp:TextBox ID="txtAddress" class="form-control" placeholder="Address *" style="margin-left:60px;" runat="server"></asp:TextBox><br />     
                        </div><br />

                         <div class="col-md-10">
                             <asp:TextBox ID="txtuser" class="form-control" placeholder="Email *"  style="margin-left:60px;" runat="server"></asp:TextBox><br />
                            <%--<input type="password" class="form-control" placeholder="User Name *" value="" />--%>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtuser" runat="server" ErrorMessage="Requires pattern +92 OR 03322321234...!" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                        </div><br />

                         <div class="col-md-10">
                             <input type="password" id="txtPassword" class="form-control" placeholder="Password *" value="" style="margin-left:60px;" runat="server"/><br />
                              <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtPassword" runat="server" ErrorMessage="Not-Valid" Display="Dynamic" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d){8,}$"></asp:RegularExpressionValidator>--%>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password must be atleast 4 and include at least one numeric digit." Display="Dynamic" ForeColor="Red" ValidationExpression="^(?=.*\d).{4,}$"></asp:RegularExpressionValidator>
                             </div><br />

                         <div class="col-md-10">
                             <asp:TextBox ID="txtQualification" class="form-control" placeholder="Qualification *" style="margin-left:60px;" runat="server"></asp:TextBox><br />
                            <%--<input type="password" class="form-control" placeholder="User Name *" value="" />--%>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtQualification" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                        </div><br />

                         <div class="col-md-10">
                             <asp:TextBox ID="txtSpecilaization" class="form-control" placeholder="Specialization *" style="margin-top:-18px; margin-left:60px;" runat="server"></asp:TextBox><br />
                            <%--<input type="password" class="form-control" placeholder="User Name *" value="" />--%>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtSpecilaization" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                              
                             <asp:Button ID="Button1"   class="btnSubmit bg-primary border-primary text-white col-3 " runat="server" Text="Submit"  OnClick="btnSubmit_Click"/>
                        </div>
                     
                         
                        </div>
                      
                    </form><br /><br />
                </div>
            </div>
      
        </center>

</asp:Content>
