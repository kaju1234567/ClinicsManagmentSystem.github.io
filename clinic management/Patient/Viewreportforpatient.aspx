<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="Viewreportforpatient.aspx.cs" Inherits="clinic_management.Viewreportforpatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #viewreport{
           height:20%;
            text-align: center;
            position:relative;
            padding-top:3%;
              padding-bottom:3%;
        }
        .container h5{
            margin-left:2%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     < <div id="viewpatient">
           <div class="container login-container">
             <div class="row">
                <div class="col-md-10 offset-md-1 signup">
                    

                    <!-- 
                        r.`patientreportid`, p.`FirstName` AS 'Patient',d.`FirstName` AS 'Doctor',
                                                        t.`day`,CONCAT(ft.`time`,' - ',`ttime`.`time`) AS 'Timing',r.`report`,r.`file`
                        -->
                    <h4 align="center" class="text-primary">PATIENTS REPORTS</h4>
                    <br /><br />
                        <div class="col-md-12 offset-md-2">
                           <asp:GridView ID="gridReports" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="891px" >  
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>  
                                                                             
                                        <asp:TemplateField HeaderText="Patient">  
                                            <ItemTemplate>  
                                                <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Patient") %>'></asp:Label>  
                                            </ItemTemplate>  
                                            <EditItemTemplate>  
                                                <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Patient") %>'></asp:TextBox>  
                                            </EditItemTemplate>  
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Doctor">  
                                            <ItemTemplate>  
                                                <asp:Label ID="Doctor" runat="server" Text='<%#Eval("Doctor") %>'></asp:Label>  
                                            </ItemTemplate>  
                                            <EditItemTemplate>  
                                                <asp:TextBox ID="Doctor" runat="server" Text='<%#Eval("Doctor") %>'></asp:TextBox>  
                                            </EditItemTemplate>  
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="day">  
                                            <ItemTemplate>  
                                                <asp:Label ID="day" runat="server" Text='<%#Eval("day") %>'></asp:Label>  
                                            </ItemTemplate>  
                                            <EditItemTemplate>  
                                                <asp:TextBox ID="day" runat="server" Text='<%#Eval("day") %>'></asp:TextBox>  
                                            </EditItemTemplate>  
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Timing">  
                                            <ItemTemplate>  
                                                <asp:Label ID="Timing" runat="server" Text='<%#Eval("Timing") %>'></asp:Label>  
                                            </ItemTemplate>  
                                            <EditItemTemplate>  
                                                <asp:TextBox ID="Timing" runat="server" Text='<%#Eval("Timing") %>'></asp:TextBox>  
                                            </EditItemTemplate>  
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Report">  
                                            <ItemTemplate>  
                                                <asp:Label ID="lbl_City" runat="server" Text='<%#Eval("report") %>'></asp:Label>  
                                            </ItemTemplate>  
                                            <EditItemTemplate>  
                                                <asp:TextBox ID="txt_City" runat="server" Text='<%#Eval("report") %>'></asp:TextBox>  
                                            </EditItemTemplate>  
                                        </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="Download">  
                                            <ItemTemplate>  
                                                <a href="../Patient/<%#Eval("file") %>" class="btn btn-info">Report</a>
                                            </ItemTemplate>  
                                            <EditItemTemplate>                                                  
                                                
                                            </EditItemTemplate>  
                                        </asp:TemplateField> 
                                    </Columns>  
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" ForeColor="#ffffff" Font-Bold="True"/>  
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"/>  
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>  
                            
                        </div>
                       

                    
                </div>
            </div>
           </div>
    
   </div>
</asp:Content>
