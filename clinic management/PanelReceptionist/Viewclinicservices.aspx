<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Viewclinicservices.aspx.cs" Inherits="clinic_management.PanelReceptionist.Viewclinicservices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
         #viewclinics{
           height:20%;
            text-align: center;
            position:relative;
              padding-top:3%;
               padding-bottom:3%;
        }
        table {
            border:1px solid black; 
             margin-left: 0px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="viewclinics">
           <center>
               <form runat="server">
                   <asp:GridView ID="gridViewClinic" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="166px" Width="1000px">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       <Columns>
                           <asp:TemplateField HeaderText="Edit">
                               <ItemTemplate>
                                   <asp:Button ID="btnEdit" CssClass="btn btn-primary" runat="server" CausesValidation="false" CommandName="" OnClick="btnEdit_Click" Text="Edit Clinic Service" />
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Delete">
                               <ItemTemplate>
                                   <asp:Button ID="btnDelete" CssClass="btn btn-danger" runat="server" CausesValidation="false" CommandName="" Text="Delete Clinic Service" OnClick="btnDelete_Click" />
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
               </form>
               
           </center>
   </div>
   
</asp:Content>
