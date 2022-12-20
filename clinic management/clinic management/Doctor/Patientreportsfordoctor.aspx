<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="Patientreportsfordoctor.aspx.cs" Inherits="clinic_management.Patientreportsfordoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #patientreports{
           height:20%;
            text-align: center;
            position:relative;
            padding-top:3%;
              padding-bottom:3%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="patientreports">
           <h2>
               Patient Reports
           </h2>
   </div>
</asp:Content>
