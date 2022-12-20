<%@ Page Title="" Language="C#" MasterPageFile="~/homemaster.Master" AutoEventWireup="true" CodeBehind="MapClinic.aspx.cs" Inherits="clinic_management.MapClinic" %>
<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
        <center>
        <h3 style="margin-top:10%">Clinics</h3>
        <div style="margin-top:2%">
        <asp:TextBox ID="txtSearch"  runat="server"></asp:TextBox>
        <asp:Button ID="btnClick" runat="server" Text="Search" OnClick="btnClick_Click" />
            </div>
        <div style="margin-top:4%; margin-bottom:5%;">
            <cc1:GMap  ID="GMap1" runat="server" Width="800px" Height="500px"/>
            <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>
        </div>

            </center>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
