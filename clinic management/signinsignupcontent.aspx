<%@ Page Title="" Language="C#" MasterPageFile="~/homemaster.Master" AutoEventWireup="true" CodeBehind="signinsignupcontent.aspx.cs" Inherits="clinic_management.signinsignupcontent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Signup/Login</title>
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
    
    margin-bottom:10%;
    padding-bottom:12%;
    margin-top: 9%;
 
}
 
.signup{
   
    padding:3%;
 box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
        background: linear-gradient(to right, white 10%,  cadetblue 90%);
          border-top-right-radius:45%;
}
.col-md-7 h3{
  
   text-align:left;
   margin-left:28%;
     font-weight:bold;
    
}

.btnSubmit
{
    width: 40%;
    border-radius: 1rem;
    padding: 1.5%;
    border: none;
    cursor: pointer;
    color:white;
    background-color:blue;
    font-weight:bold;
}

.signup.btnSubmit{
    font-weight: 600;
    color: #0062cc;
    background-color: #fff;
}

.col-md-7{
    border-style:solid;
    border-color:cadetblue;
}

     </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--signup -->
     <center>
    <div class="container login-container">
            <div class="row">
                
              
               
              
                <div class="col-md-7 offset-3 signup  ">
                    <h3>SIGNUP</h3>
                    <form runat="server" id="Signup">
                        <div class="offset-md-1 row" >
                            <asp:TextBox ID="txtFirstname" class="form-control col-md-10 rounded" placeholder="First Name* " style="margin-bottom:28px; " runat="server"></asp:TextBox>
                           
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtFirstname" runat="server" ErrorMessage=" Numeric and special character are not allowed...!" ForeColor="#800000" ValidationExpression="^[A-Za-z. ]{3,50}$"></asp:RegularExpressionValidator>
                        </div>
                    
                        <div class="offset-md-1 row" >
                            <asp:TextBox ID="txtLastname" class="form-control col-md-10 rounded" placeholder="Last Name* " style="margin-bottom:28px; " runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="Last Name *" value="" />--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtLastname" runat="server" ErrorMessage="Numeric and special character are not allowed...!" Display="Dynamic" ForeColor="#800000" ValidationExpression="^[A-Za-z ]{3,50}$"></asp:RegularExpressionValidator>
                        </div>
                       
                        <div class="row" style="margin-left:50px">
                            <asp:TextBox ID="txtCnic" class="form-control col-md-10 rounded" placeholder="CNIC* "  style="margin-bottom:28px; "  runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="CNIC *" value="" />--%>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtCnic" runat="server" ErrorMessage="Required Pattern: 12345-1234567-1" Display="Dynamic" ForeColor="#800000" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$"></asp:RegularExpressionValidator>
                        </div>
                    
                         <div class="row" style="margin-left:50px ">
                             <asp:DropDownList ID="ddlGender" style="margin-bottom:28px;" class="form-control col-md-10 rounded" runat="server">
                                 <asp:ListItem>-- Select Gender* --</asp:ListItem>
                                 <asp:ListItem>Male</asp:ListItem>
                                 <asp:ListItem>Female</asp:ListItem>
                                 <asp:ListItem>Other</asp:ListItem>
                             </asp:DropDownList>
                        </div>
                      
                         <div class="row" style="margin-left:50px">
                             <asp:TextBox ID="txtContact"  class="form-control col-md-10 rounded" placeholder="Contact*" style="margin-bottom:28px;" runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="Contact *" value="" --%>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtContact" runat="server" ErrorMessage="Required pattern EX: +92 OR 03322652345" Display="Dynamic" ForeColor="Red" ValidationExpression="^[+]{1}[9]{1}[2]{1}[0-9]{10}|[0]{1}[0-9]{10}$"></asp:RegularExpressionValidator>
                                    </div>

              
                      
                       <%--  <div class="row" style="margin-left:50px">
                             <asp:TextBox ID="txtEmail" class="form-control col-md-10 rounded" placeholder="Email* " style="margin-bottom:28px;" runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="Email *" value="" />--%>
                            <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtEmail" runat="server" ErrorMessage="Required Pattern: abc12@gmail.com" Display="Dynamic" ForeColor="#800000" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                        </div>--%>
                      
                         <div class="row" style="margin-left:50px">
                             <asp:TextBox ID="txtAddress" class="form-control col-md-10 rounded" placeholder="Address*" style="margin-bottom:28px;"  runat="server"></asp:TextBox>
                             
                        </div>
                       
                         <div class="row" style="margin-left:50px">
                             <asp:TextBox ID="txtuser" class="form-control col-md-10 rounded" placeholder="Email*" style="margin-bottom:28px;" runat="server"></asp:TextBox>
                            <%--<input type="password" class="form-control" placeholder="User Name *" value="" />--%>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtuser" runat="server" ErrorMessage="invalid" Display="Dynamic" ForeColor="Red" ValidationExpression="^[A-Za-z]{3,}[0-9]{0,}@[A-Za-z]{3,}[.]{1}[A-Za-z]{3}$"></asp:RegularExpressionValidator>
                        </div>
                       
                         <div class="row" style="margin-left:50px">
                             <input type="password" id="txtPassword" class="form-control col-md-10 rounded" placeholder="Password*" style="margin-bottom:28px;"  value="" runat="server"/>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password must be atleast 4 and include at least one numeric digit." Display="Dynamic" ForeColor="Red" ValidationExpression="^(?=.*\d).{4,}$"></asp:RegularExpressionValidator>
                        </div>
                       
                         
                         <div class="row" style="margin-left:50px">
                             <asp:Button ID="btnSubmit" class="btnSubmit border-primary offset-md-3 col-md-4 rounded" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                            
                        </div>
                      
                    </form>
                    <br /> <br />
                </div>
            </div>
        </div> 
</asp:Content>
