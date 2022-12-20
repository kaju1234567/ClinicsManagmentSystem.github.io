<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Adddisease.aspx.cs" Inherits="clinic_management.PanelReceptionist.Adddisease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css" />
    
    <style>
      
        #adddisease h3{
            
             font-weight:bold;
             text-decoration:underline;
         }
         .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:15%; 
               padding-bottom:5%;
               margin-top:2%;
            
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
  
    	<div class="offset-md-4 col-md-5 ">
		    <div class="card" >
		       
                     <div id="adddisease"  class=" text-primary" >
           <h3 class="offset-md-4">
               ADD DISEASE 
           </h3>
   
		                    <form runat="server">
                              <div class="offset-md-2 col-md-10">


                                <%--<label for="firstname" class="col-4 col-form-label">c</label>--%> 
                                <div  style="margin-top:3%; margin-bottom:-18px;"> 
                                  <input id="txtDisease" name="txtDisease" placeholder="Disease" class="form-control here" required="required" type="text" runat="server">
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtDisease" runat="server" ErrorMessage="Special Character and numeric are not allowed....!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                                </div>
                                  <br />
                              </div>
                                
                                <div class="offset-md-2 col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div>
                                        <asp:DropDownList ID="ddlservices" class="form-control here selectpicker" data-live-search-style="begins"  data-live-search="true" runat="server"></asp:DropDownList>
                                   </div>
                                     <br />
                              </div>
                               
                              <div class="offset-md-2 col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div>
                                        <input id="txtDecription" name="contact" placeholder="Description" class="form-control here" required="required" type="text" runat="server">
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtDecription" runat="server" ErrorMessage="Special Character and numeric are not allowed....!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                                
                                         </div>
                                   <br />
                              </div>
                               
                                 <div class="offset-md-2 col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div>
                                    <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                                 <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                                </div>
                                      <br />
                              </div>
                               
                             
                                  <div class="offset-md-5 col-md-10">
                            
                                  <button name="submit" id="btnsubmit"  class="btn btn-primary"  runat="server" onserverclick="btnsubmit_ServerClick">Add Disease</button>
                                <br /> <br /> </div>
                             
                                <asp:Label ID="lblMsg" runat="server" style="color:red"></asp:Label>
                            </form>
		                </div>
		            </div>
		            </div>
                </div>
            </div>
        <h1></h1>
        <h1></h1>
     <script>
    $(function () {
        $("#<%=ddlservices.ClientID%>").select2();
    })
</script>
</asp:Content>
