<%@ Page Title="" Language="C#" MasterPageFile="~/homemaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="clinic_management.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <style>
         li{
         font-weight:bold; 
         padding-top:19px;
      }
      .form-control{
          border-color:gray;
        
      }
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
        background: linear-gradient(to right, white 10%,  cadetblue 90%);
          border-top-right-radius:45%;

}
.login-form-1 h3{
   
    color: #333;
     font-weight:bold;
}

.login-container form{
    padding-left:12%;
  
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


.login-form-1 .ForgetPwd{
    color: #0062cc;
    font-weight: 600;
    text-decoration: none;
}
.offset-3{
     border-style:solid;
    border-color:cadetblue;
  
}


     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     
    <div class="container login-container">
            <div class="row">
                <div class="offset-3  col-md-6 login-form-1">
                    <h3 class="text-primary" style="margin-left:30px;">CHANGE PASSWORD</h3>
                    <Form runat="server">
                        <div class="row">
                            <asp:TextBox ID="txtoldpwd" class="form-control col-md-12 rounded" placeholder="Old Password*" runat="server" ></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtoldpwd" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="Enter Old Password...!"></asp:RequiredFieldValidator>--%>
                           
                        </div>
                        <br />

                        <div class="row">
                            <input type="password" runat="server" id="txtPassword" class="form-control col-md-12 rounded" placeholder="Your Password *" value="" />
           <div style="margin-top:8%"> <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password must be atleast 4 and include at least one numeric digit." Display="Dynamic" ForeColor="Red" ValidationExpression="^(?=.*\d).{4,}$"></asp:RegularExpressionValidator>
                        </div></div>
                         <br />
                         <div class="row">
                            <input type="password" runat="server" id="txtforgetpwd" class="form-control col-md-12 rounded" placeholder="Confirm password" value="" />
                       <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="Confirm password...!"></asp:RequiredFieldValidator>--%>
                            </div>
                         <br />
                        <div >
                            <div style="margin-top:40px;" class="row">
                                    <asp:Button ID="btnConfirmpwd"   class="form-control  btnSubmit offset-md-2" runat="server" Text="Change"  OnClick="btnConfirmpwd_Click"></asp:Button >
                                </div>
                            <br />
                            <div class="row">
                                    <asp:Button ID="btnCancel"  class="form-control  btnSubmit offset-md-2 " runat="server" Text="Cancel"  OnClick="btnCancel_Click"></asp:Button >
                            
                            </div>
                     
                            
                            
                        <div class="row">
                            <asp:Label ID="lblMsg" runat="server" ></asp:Label>
                        </div>
                    </Form>
                </div>
        </div>
        </div><br /><br />
         </center>
 
  

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
