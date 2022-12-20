<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="PatientHistory.aspx.cs" Inherits="clinic_management.PatientHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #viewpatient{
           height:20%;
            text-align: center;
            position:relative;
            padding-top:3%;
              padding-bottom:3%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="viewpatient">
           <div class="container login-container">
           
            <div class="row">
                <div class="col-md-10 offset-md-2 signup">
                    <br />
                    <h3 style="text-align=center;margin-bottom:2%; font-weight:bold;" class="text-primary">Patient History</h3><br />
                        <div  class="col-md-12">
                            <asp:GridView  ID="gridAppointments" runat="server" CellPadding="4" ForeColor="#333333" CssClass="table table-responsive" GridLines="None" Width="841px" >
                                
                                <AlternatingRowStyle BackColor="White" />
                                 <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="CadetBlue" Font-Bold="True" ForeColor="black" BorderColor="#009999" BorderWidth="2px"   />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
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
     <br />
             <div class="row">
                <div class="col-md-10 offset-md-2 signup">
                    <br />
                    <h3 style="text-align=center;margin-bottom:2%; font-weight:bold;" class="text-primary">Patient Reports</h3>
                        <div class="offset-md-5 col-md-12">
                           <asp:GridView  ID="gridReports" runat="server" AutoGenerateColumns="False" CellPadding="6" >  
                                    <Columns>  
                                                                             
                                        <asp:TemplateField HeaderText="Patient">  
                                            <ItemTemplate>  
                                                <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Patient") %>'></asp:Label>  
                                            </ItemTemplate>  
                                            <EditItemTemplate>  
                                                <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Patient") %>'></asp:TextBox>  
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
                                                <a href="../Patient/<%#Eval("file") %>" class="btn btn-info"><i style=" font-size:20px;" class="fa fa-download"></i></a>
                                            </ItemTemplate>  
                                            <EditItemTemplate>  
                                                
                                                
                                            </EditItemTemplate>  
                                        </asp:TemplateField> 
                                    </Columns>  
                                    <HeaderStyle BackColor="CadetBlue" Font-Bold="True" ForeColor="black" BorderColor="#009999" BorderWidth="2px"  />  
                                    <RowStyle BackColor="#e7ceb6"/>  
                            </asp:GridView>  
                            
                        </div>
                       

                    
                </div>
            </div>
           </div>
    
   </div>
</asp:Content>
