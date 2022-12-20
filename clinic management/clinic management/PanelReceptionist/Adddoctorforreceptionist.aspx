<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Adddoctorforreceptionist.aspx.cs" Inherits="clinic_management.Adddoctorforreceptionist" %>
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
               border-top-right-radius:29%;
              padding-bottom:10%;
}
  #adddoctor h3{
           
             padding-bottom:5px;
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
     <div class="col-md-12">
		    <div class="offset-md-3 card col-md-7  ">
		           <div id="adddoctor"  class="col-md-12 text-primary">
           <h3 >
               ADD DOCTOR
           </h3>
                    <form runat="server">
                        <div class="offset-md-2 col-md-10">
                            <asp:TextBox ID="txtFirstname" class="form-control" placeholder="First Name *" style="margin-bottom:-18px;" runat="server"></asp:TextBox>
                           <%-- <input id="Firstname" name="Firstname" placeholder="Firstname" class="form-control here" required="required" type="text" runat="server">--%>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFirstname" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                        </div><br />
                        <div class="offset-md-2 col-md-10">
                            <asp:TextBox ID="txtLastname" class="form-control" placeholder="Last Name *" runat="server"></asp:TextBox>
                           <%-- <input id="lastname" name="name" runat="server"  placeholder="Last Name" class="form-control here" type="text">--%>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtLastname" runat="server" ErrorMessage="Numeric and special character are not allowed...!" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z ]{3,50}$"></asp:RegularExpressionValidator>
                        </div><br />
                        <div class="offset-md-2 col-md-10">
                            <asp:TextBox ID="txtCnic" class="form-control" placeholder="CNIC *" runat="server"></asp:TextBox>
                              <%--<input id="cnic" name="cnic" runat="server"  placeholder="CNIC" class="form-control here" type="text">--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtCnic" runat="server" ErrorMessage="Required Pattern: 12345-1234567-1" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"></asp:RegularExpressionValidator>
                        </div><br />
                         <div class="offset-md-2 col-md-10">
                             <asp:DropDownList ID="ddlGender" class="form-control" runat="server">
                                 <asp:ListItem>-- Select Gender --</asp:ListItem>
                                 <asp:ListItem>Male</asp:ListItem>
                                 <asp:ListItem>Female</asp:ListItem>
                                 <asp:ListItem>Other</asp:ListItem>
                             </asp:DropDownList>
                        </div><br />
                         <div class=" offset-md-2 col-md-10">
                             <asp:TextBox ID="txtContact" class="form-control" placeholder="Contact *" runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="Contact *" value="" --%>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtContact" runat="server" ErrorMessage="Required Pattern: +92 OR 03456323456" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]{1}[9]{1}[2]{1}[0-9]{10}|^[0]{1}[0-9]{10}$"></asp:RegularExpressionValidator>
                        </div><br />
                        <%-- <div class="offset-md-2 col-md-10">
                             <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email *" runat="server"></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtEmail" runat="server" ErrorMessage="Required Pattern: abc12@gmail.com" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                        </div><br />--%>
                         <div class="offset-md-2 col-md-10">
                             <asp:TextBox ID="txtAddress" class="form-control" placeholder="Address *" runat="server"></asp:TextBox>
                             
                        </div><br />
                         <div class="offset-md-2 col-md-10">
                             <asp:TextBox ID="txtuser" class="form-control" placeholder="Email *" runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="User Name *" value="" />--%>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtuser" runat="server" ErrorMessage="Required Pattern: abc12@gmail.com" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                         </div><br />
                         <div class="offset-md-2 col-md-10">
                             <input type="password" id="txtPassword" class="form-control" placeholder="Password *" value="" runat="server"/>
                              <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtPassword" runat="server" ErrorMessage="Not-Valid" Display="Dynamic" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d){8,}$"></asp:RegularExpressionValidator>--%>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password must be atleast 4 and include at least one numeric digit." Display="Dynamic" ForeColor="Red" ValidationExpression="^(?=.*\d).{4,}$"></asp:RegularExpressionValidator>
                             </div><br />
                         <div class="offset-md-2 col-md-10">
                             <asp:TextBox ID="txtQualification" class="form-control" placeholder="Qualification *" runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="User Name *" value="" />--%>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtQualification" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>

                              
                        </div><br />
                         <div class="offset-md-2 col-md-10">
                             <asp:TextBox ID="txtSpecilaization" class="form-control" placeholder="Specialization *" style="margin-top:-18px;" runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="User Name *" value="" />--%>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtSpecilaization" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                              
                        </div>
                        <div class="offset-md-2 col-md-10 " style="font-weight:bold; color:darkblue;">
                            <asp:FileUpload ID="FileUploadDoctorimage"  runat="server"  />(Upload image)
                            <asp:RegularExpressionValidator   id="FileUpLoadValidator" runat="server"   ErrorMessage="Upload Jpegs and Gifs only."   ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF)$"   ControlToValidate="FileUploadDoctorimage">  
                          </asp:RegularExpressionValidator>
                              
                        </div>
                       
                         <div class="offset-md-2 col-md-12">
                             <asp:Button ID="btnSubmit"  class="btnSubmit bg-primary border-primary text-white offset-md-1 col-4" runat="server" Text="Submit"  OnClick="btnSubmit_Click"/>
                            
                        </div>
                       
                       
                    </form>
                </div>
            </div>
        </div>
        </center>
</asp:Content>
