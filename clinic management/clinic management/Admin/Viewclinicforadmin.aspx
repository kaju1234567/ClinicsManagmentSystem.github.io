<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Viewclinicforadmin.aspx.cs" Inherits="clinic_management.Viewclinicforadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      
        table {
            border:1px solid; 
            border-color:black;
            margin-top:1%;
           margin-bottom:7%;
           
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
           <center>
               <form runat="server" style="padding-left:10%;">
                   <asp:GridView ID="gridViewClinic" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       <Columns>
                           <asp:TemplateField HeaderText="Edit">
                               <ItemTemplate>
                                   <asp:Button ID="btnEditclinic" CssClass="btn btn-primary" runat="server" CausesValidation="false" CommandName="" OnClick="btnEditclinic_Click" Text="Edit Clinic" />
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Delete">
                               <ItemTemplate>
                                   <asp:Button ID="btnDeleteclinic" CssClass="btn btn-danger" runat="server" CausesValidation="false" CommandName="" Text="Delete Clinic" OnClick="btnDeleteclinic_Click" />
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

   
</asp:Content>
