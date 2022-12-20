<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="Uploadreportforpatient.aspx.cs" Inherits="clinic_management.Uploadreportforpatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #uploadreport{
           height:20%;
            text-align: center;
            position:relative;
            padding-top:3%;
              padding-bottom:3%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container login-container">
           
            <div class="row">
                <div class="col-md-8 offset-2 signup">
                    <br />
                    <h3 align="center">Reports</h3>
                    <form id="Signup">
                        <div class="form-group">
                            <asp:TextBox ID="txtTitle" class="form-control" placeholder="" style="margin-bottom:-18px;" runat="server"></asp:TextBox>
                        </div>
                        <br />
                        <div class="form-group text-primary" style="font-weight:bold">
                            <asp:FileUpload ID="FileUploadDoctorimage"  runat="server"  />(Upload image)
                            <%--<asp:RegularExpressionValidator   id="FileUpLoadValidator" runat="server"   ErrorMessage="Upload Jpegs and Gifs only."   ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF)$"   ControlToValidate="FileUploadDoctorimage">  --%>
                          <%--</asp:RegularExpressionValidator>--%>
                              
                        </div>
                        <br />
                        <div class="form-group">
                             <asp:Button ID="btnSubmit"  class="btnSubmit bg-primary text-white offset-3" runat="server" Text="Submit"  OnClick="btnSubmit_Click"/>
                            
                        </div>
                       <br/>
                        <div class="form-group">
                            <asp:GridView ID="gridReports" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="838px">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDltreport" runat="server" CausesValidation="false" CommandName="" OnClick="btnDltreport_Click" Text="Delete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            
                        </div>
                       

                    </form>
                </div>
            </div>
     </div>
       
</asp:Content>
