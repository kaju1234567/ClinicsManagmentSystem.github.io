<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="Viewtimingforpatient.aspx.cs" Inherits="clinic_management.Viewtimingforpatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #viewtiming{
           height:20%;
            text-align: center;
            position:relative;
            padding-top:3%;
              padding-bottom:3%;
        }
        .visible {
          visibility: visible;
        }
        .invisible {
          visibility: hidden;
        }

        .button{

            width:30%;
            margin-left:10px;
            padding-left:20px;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row"></div>
    <div class="row" >
        <div class="offset-md-2 col-md-9 align-content-center">


            <table class="table table-responsive align-content-center" style="margin-top:30px; width:816px" align="center">
                <tr>
                    <td colspan="9" class="text-center bg-primary" style="color:white"><h3>Appointments</h3></td>
                </tr>
                <tr class="alert-danger" style="color:black">

                    <td>ClinicName</td>
                    <td>Doctor</td>
                    <td>Patient Timing</td>
                    <td>Status</td>
                    <td>Appointmentdate</td>
                    <td>Clinic Status</td>
                    <td>Action</td>

                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            
                            <td><%# Eval("ClinicName") %></td>
                            <td><%# Eval("Doctor") %></td>
                            <td><%# Eval("Timing") %></td>
                            <td ><%# Eval("PatientStatus") %></td>
                            <td ><%# ((string)Eval("PatientStatus") != "Cancelled")? Eval("Appointmentdate"):"Not exist" %></td>
                            <td  class='<%# ((string)Eval("ClinicStatus") == "Done") ? "text-success" : "text-danger" %>'><%# Eval("ClinicStatus") %></td>
                            
                            <td class="button">
                                
                                <a href="CancelAppointmentPatient.aspx?PatientAppointmentId=<%#Eval("PatientAppointmentId")%>" 
                                    class="btn btn-danger <%# ( (string)Eval("PatientStatus") == "Cancelled" || (string)Eval("PatientStatus") == "Done" || (string)Eval("ClinicStatus") != "Done") ? "invisible" : "visible" %>">
                                    Cancel
                                    
                                </a>   
                                <a href="Uploadreportforpatient.aspx?PatientAppointmentId=<%#Eval("PatientAppointmentId")%>" 
                                    class="btn btn-primary  <%# (((string)Eval("PatientStatus") == "Accepted" || ((string)Eval("PatientStatus") == "Done")) && ((string)Eval("ClinicStatus") == "Done")) ? "visible" : "invisible"  %>">
                                 Upload Reports</a>

                            </td>

                        </tr>
                   
                    </ItemTemplate>
                </asp:Repeater>
            </table>

        </div>

    </div>



    <div class="row" style="margin-bottom: 60px"></div>


</asp:Content>
