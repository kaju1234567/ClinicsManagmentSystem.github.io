<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="UpdateDoctorTimeTable.aspx.cs" Inherits="clinic_management.UpdateDoctorTimeTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .card {
            border: 2px solid;
            border-color: cadetblue;
            border-radius: 1%;
            margin-bottom: 20%;
            padding-bottom: 17%;
            background: linear-gradient(to right, white 10%, cadetblue 90%);
            border-top-right-radius: 30%;
        }
    </style> 
    
    <center>

    
         
        </center>
    	<div class="offset-4 col-md-6 ">
		    <div class="card"  >
		        <div class="card-body">
		            <div class="row ">
                       <div id="Add DOCTER TIME TABLE"  class="text-primary" style=" margin-left:100px;  " >
                        <h2>
             <b><u>UPDATE DOCTER TIME</u>  </b>
           </h2></div>
		                <div class="col-md-10 offset-md-3">
                            
		                    <form runat="server">
                              
                                <div class="form-group row">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div class="col-12">
                                        <asp:DropDownList ID="ddlDoctors" class="form-control here selectpicker" Visible="false" data-live-search-style="begins"  data-live-search="true" runat="server"></asp:DropDownList>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlDoctors" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="please insertef the value...!"></asp:RequiredFieldValidator>
                                   </div>
                              </div>
                          

                                <div class="form-group row">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div class="col-12">
                                        <asp:DropDownList ID="ddlfromtime" class="form-control here selectpicker" data-live-search-style="begins"  data-live-search="true" runat="server"></asp:DropDownList>
                                   </div>
                              </div>
                                 <div class="form-group row">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div class="col-12">
                                        <asp:DropDownList ID="ddltotime" class="form-control here selectpicker" data-live-search-style="begins"  data-live-search="true" runat="server"></asp:DropDownList>
                                   </div>
                              </div>

                                <div class="form-group row">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div class="col-12">
                                        <asp:DropDownList ID="ddlDays" class="form-control here selectpicker" data-live-search-style="begins"  data-live-search="true" runat="server"></asp:DropDownList>
                                   </div>
                              </div>
                                                           
                              
                              

                                 <div class="form-group row">
                                <%--<label for="contact" class="col-4 col-form-label">Contact</label> --%>
                                 <div class="col-12">
                                        <input id="txtDecription" name="txtDecription" placeholder="Description" class="form-control here" required="required" type="text" runat="server">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtDecription" Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="Please Enter Description....!"></asp:RequiredFieldValidator>
                                         
                                   </div>
                              </div>


                              
                                 <div class="form-group row">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div class="col-12">
                                    <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                                 <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                                </div>
                              </div>
                              
                             
                                  <div class="form-group row">
                                <div class="col-12 text-right">
                                  <button name="submit" id="btnUpdate"  class="btn btn-primary" onserverclick="btnUpdate_ServerClick" runat="server"  >Update Disease</button>
                                </div>
                              </div>
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
        $("#<%=ddlDoctors.ClientID%>").select2();
        $("#<%=ddlfromtime.ClientID%>").select2();
        $("#<%=ddltotime.ClientID%>").select2();
    })
</script>



</asp:Content>
