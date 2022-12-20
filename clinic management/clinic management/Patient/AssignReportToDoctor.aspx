<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="AssignReportToDoctor.aspx.cs" Inherits="clinic_management.AssignReportToDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
   <style>
       .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
               margin-top:5%;
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
               
         }

   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="viewpatient">
        <div class="container login-container">
           <div class="card col-md-7 offset-md-2">

                    <h3 align="center" style="font-weight:bold;margin-top:5%" class="text-primary">ASSIGN REPORTS TO DOCTOR</h3>
                    <br />
                    <div class="col-md-12 ">
                        <asp:DropDownList ID="ddlDoctor"  runat="server" CssClass=" col-md-10  selectpicker" data-live-search-style="begins"  data-live-search="true" OnSelectedIndexChanged="ddlDoctor_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <br />
                    <div class="col-md-12 ">
                        <asp:DropDownList ID="ddlReports"  runat="server" CssClass=" col-md-10  selectpicker" data-live-search-style="begins"  data-live-search="true"></asp:DropDownList>
                        
                    </div>
                    <br/>
                    <div class="row ">
                        <div class="offset-md-1 col-md-4 ">
                            <input type="date" class="form-control" style="margin-left:5px"  runat="server" id="txtFromDate" placehoder="From Date" />
                        </div>
                        <div class="offset-md-1 col-md-4 ">
                            <input type="date" class="form-control" style="margin-left:18px" runat="server" id="txtToDate" placehoder="To Date" />
                        </div>
                       <%-- <input type="date" CssClass="offset-md-4 col-md-4" runat="server" id="txtFromDate" placehoder="From Date" />
                        <input type="date" CssClass="col-md-4" runat="server" id="txtToDate" placehoder="To Date" />_--%>
                        
                    </div>
                    <br/><br />
                   
                    
                        <div class=" offset-md-5 col-md-10 float-right ">
                            <asp:Button ID="btnSave" runat="server" Width="60" Text="Save" OnClick="btnSave_Click"  CssClass="btn btn-success bg-primary btn-sm"/>
                        </div>
                        
                   
                    <br/>
               <center>
                    <div  class="col-md-12">
                        <div class="col-md-12" style="padding-bottom:15px;padding-top:15px;padding-right:15px;padding-left:15px;">
                            <asp:GridView ID="griddoctorreports" runat="server" CssClass="table bg-white">
                                <Columns>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:Button ID="btnEdit" runat="server" CausesValidation="false"  OnClick="btnEdit_Click" Text="Edit" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDelete" runat="server" CausesValidation="false" OnClick="btnDelete_Click" Text="Delete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                

                    <div class="row">
                        <div class="col-md-12">
                            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
     <script>
        $(function () {
            $("#<%=ddlDoctor.ClientID%>").select2();
        })
</script>

</asp:Content>
