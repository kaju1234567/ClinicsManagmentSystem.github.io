<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Viewreceptionist.aspx.cs" Inherits="clinic_management.PanelReceptionist.Viewreceptionist" %>
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
             margin-left: 100px;
             margin-bottom: 0px;
             margin-top: 66px;
             margin-right: 0px;
         }
       
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <form id="form1" runat="server">
      
        <asp:GridView ID="GridReceptionist"  runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="88%" Height="124px" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="EDIT">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="" OnClick="btnEdit" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DELETE">
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" CausesValidation="false" OnClick="btnDelete" Text="Delete" />
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
