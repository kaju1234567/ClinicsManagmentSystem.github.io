<%@ Page Title="" Language="C#" MasterPageFile="~/homemaster.Master" AutoEventWireup="true" CodeBehind="Forgetpassword.aspx.cs" Inherits="clinic_management.Forgetpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
         /*--------------------------------------------------------------
# forms
--------------------------------------------------------------*/
 .login-container{
    margin-top: 9%;
    margin-bottom: 5%;
    
 
}
 
.login-form-1{
    padding: 5%;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
    border-radius:5%;

}
.login-form-1 h3{
    text-align: center;
    color: #333;
     font-weight:bold;
}
.signup{
    padding: 5%;
    background: #0062cc;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
    border-radius:5%;
}
.signup h3{
    text-align: center;
    color: #fff;
   
}
.login-container form{
    padding: 10%;
  
}
.btnSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    border: none;
    cursor: pointer;
}
.login-form-1 .btnSubmit{
    font-weight: 600;
    color: #fff;
    background-color: #0062cc;
}
.signup.btnSubmit{
    font-weight: 600;
    color: #0062cc;
    background-color: #fff;
}

.login-form-1 .ForgetPwd{
    color: #0062cc;
    font-weight: 600;
    text-decoration: none;
}
.offset-3{
     border-style:solid;
    border-color:dodgerblue;
}

     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   <center>
    <div class="container login-container">
            <div class="row">
                <div class="offset-3 col-md-6 login-form-1">
                    <h3>SIGNIN</h3>
                    <Form runat="server">
                        <div class="form-group">
                            <asp:TextBox ID="txtusername" class="form-control" placeholder="Your username *" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtusername" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="Enter username...!"></asp:RequiredFieldValidator>
                           
                        </div>
                        <br />

                       <%-- <div class="form-group">
                            <input type="password" runat="server" id="txtPassword" class="form-control" placeholder="Your Password *" value="" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="Password...!"></asp:RequiredFieldValidator>
                            </div>
                         <br />
                         <div class="form-group">
                            <input type="password" runat="server" id="txtforgetpwd" class="form-control" placeholder="Confirm password" value="" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="Confirm password...!"></asp:RequiredFieldValidator>
                            </div>
                         <br />--%>
                        <div class="form-group">
                            <asp:Button ID="btnConfirmpwd"  class="form-control btnSubmit" runat="server" Text="Login"  OnClick="btnConfirmpwd_Click"></asp:Button >
                            
                        </div>
                        <br>
                        <div class="form-group">
                            <asp:Label ID="lblMsg" runat="server" ></asp:Label>
                        </div>
                    </Form>
                </div>
        </div>
        </div>
         </center>
 
  
</asp:Content>

