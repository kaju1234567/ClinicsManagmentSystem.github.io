<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="Viewpatientappointmentfordoctor.aspx.cs" Inherits="clinic_management.Viewpatientappointmentfordoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #viewpatient{
           height:20%;
            text-align: center;
            position:relative;
            padding-top:3%;
              padding-bottom:3%;
            top: 55px;
            left: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="viewpatient">
           <div style="margin:0px" class="container login-container">
           
            <div class="row">
                <div class="col-md-12 signup">
                    <br />
                    <h4 style="text-align:center; margin-bottom:2%;  font-weight:bold" class="text-primary">PATIENTS APPOINTMENT</h4><br /><br />
                        <div  class="offset-md-2 col-md-12">
                            <asp:GridView  ID="gridReports" runat="server"  ForeColor="#333333" CssClass="table table-responsive" GridLines="None" Height="175px" Width="1126px" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button class="btn-info" BorderColor="#0099ff" BorderWidth="1px" Font-Bold="True"  ID="btnAppointed" OnClick="btnAppointed_Click" runat="server" CausesValidation="false"  Text="Done" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"  />
                                <HeaderStyle BackColor="CadetBlue" Font-Bold="True" ForeColor="black" BorderColor="#009999" BorderWidth="2px" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center"  />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                            
                        </div>
                       

                    
                </div>
            </div>
     </div>
    
   </div>
</asp:Content>

