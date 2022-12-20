<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Viewdoctortimeforreceptionist.aspx.cs" Inherits="clinic_management.Viewdoctortimeforreceptionist" %>
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
             margin-left: 2px;
             margin-bottom: 0px;
             margin-top: 57px;
         }
       
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <form id="form1" runat="server">
        <asp:GridView ID="gridDoctortimings" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Height="189px" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="EDIT">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-primary" OnClick="btnEdit_Click" CausesValidation="false" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DELETE">
                    <ItemTemplate>
                        <asp:Button ID="btnDel" runat="server" CssClass="btn btn-danger" OnClick="btnDel_Click" CausesValidation="false" Text="Delete" />
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


</asp:Content>

