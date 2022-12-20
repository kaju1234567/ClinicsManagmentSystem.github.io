<%@ Page Title="" Language="C#" MasterPageFile="~/homemaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="clinic_management.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <style>

    #header{
        border: 1px solid white ; 
        background: linear-gradient(to right, white 10%,  cadetblue 90%);
    }
   
    .nav-menu a{
            color:black;
            border-bottom:none;
            font-size:15px;
            margin-left:-25%;
        }
      .nav-menu li a:hover{
            color:white;
        }
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
    margin-bottom: 15%;
  
 
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
    padding-left:20%;
    padding-bottom:15%;
  
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
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   
    <div class="container login-container">
            <div class="row">
                <div class="offset-3 col-md-6 login-form-1">
                    <h3 style="margin-left:30%;">SIGNIN</h3>
                    <Form runat="server">
                        <div class="row">
                            <asp:TextBox ID="txtusername" class="form-control col-md-12 rounded" placeholder="Your username *" runat="server" ></asp:TextBox>
                           
                        </div>
                        <br />

                        <div class="row">
                                <input type="password" runat="server" id="txtPassword" class="form-control col-md-12 rounded" placeholder="Your Password *" value="" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="Enter password...!"></asp:RequiredFieldValidator>
                            </div>
                         <br />
                        <div class="row">
                            <asp:Button ID="btnLogin"  class="btnSubmit offset-md-3  col-md-6 rounded" runat="server" Text="Login"  OnClick="btnLogin_Click"></asp:Button >
                            
                        </div>

                        <br>
                        <div class="row">
                            <asp:Label ID="lblMsg"  class="offset-md-3  col-md-6 text-danger" runat="server" Text=""></asp:Label>
                            
                        </div>
                        <br />
                        <div class="row">
                            <a href="Forgetpassword.aspx" class="form-control col-md-12 rounded">Forget Password?</a>
                        </div>
                    </Form>
                </div>
        </div>
        </div>
         </center>
 
  
</asp:Content>
