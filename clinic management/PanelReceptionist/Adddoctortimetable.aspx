<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Adddoctortimetable.aspx.cs" Inherits="clinic_management.PanelReceptionist.Adddoctortimetable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css" />
   

        <style>
.card{
            border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
              
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
 
}
  #AddDOCTERTIMETABLE h3{
             margin-top:6%; 
             padding-bottom:30px;
             font-weight:bold;
             text-decoration:underline;
             text-align:center;
         }
   .form-control{
             border-radius:10px;
             border: 2px solid gray;
         }
  
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
        
    	<div class="col-md-12 ">
		    <div class="card  col-md-6 offset-md-4">
		        
                    <div id="AddDOCTERTIMETABLE"  class="text-primary"  >
           <h3>
               ADD DOCTER TIME
           </h3>
  
		                    <form runat="server">
                              
                                <div class="offset-md-1 col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div>
                                        <asp:DropDownList ID="ddlDoctors" class="form-control here selectpicker" data-live-search-style="begins"  data-live-search="true" runat="server"></asp:DropDownList>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlDoctors" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="please insertef the value...!"></asp:RequiredFieldValidator>
                                   </div><br />
                              </div>


                                <div class="offset-md-1 col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div>
                                        <asp:DropDownList ID="ddlfromtime" class="form-control here selectpicker" data-live-search-style="begins"  data-live-search="true" runat="server"></asp:DropDownList>
                                   </div><br />
                              </div>
                                 <div class="offset-md-1 col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div>
                                        <asp:DropDownList ID="ddltotime" class="form-control here selectpicker" data-live-search-style="begins"  data-live-search="true" runat="server"></asp:DropDownList>
                                   </div><br />
                              </div>

                                <div class="offset-md-1 col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div>
                                        <asp:DropDownList ID="ddlDays" class="form-control here selectpicker" data-live-search-style="begins"  data-live-search="true" runat="server"></asp:DropDownList>
                                   </div><br />
                              </div>

                                 <div class="offset-md-1 col-md-10">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div>
                                        <input id="txtDecription" name="txtDecription" placeholder="Description" class="form-control here" required="required" type="text" runat="server">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtDecription" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="Please Enter Description....!"></asp:RequiredFieldValidator>
                                         
                                   </div><br />
                              </div>


                              
                                 <div class="offset-md-1 col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div>
                                    <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                                 <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                                </div><br />
                              </div>
                              
                             
                                  <div class="offset-md-1 col-md-10">
                                <div class=" text-right">
                                  <button name="submit" id="btnsubmit"  class="btn btn-primary"  runat="server" onserverclick="btnsubmit_ServerClick"> ADD </button>
                                </div><br /><br />
                              </div>
                                <asp:Label ID="lblMsg" runat="server" style="color:red"></asp:Label>
                            </form>
		                </div>
		            </div>
		            </div>
    </center>
     <script>
    $(function () {
        $("#<%=ddlDoctors.ClientID%>").select2();
        $("#<%=ddlfromtime.ClientID%>").select2();
        $("#<%=ddltotime.ClientID%>").select2();
    })
</script>
    


</asp:Content>
