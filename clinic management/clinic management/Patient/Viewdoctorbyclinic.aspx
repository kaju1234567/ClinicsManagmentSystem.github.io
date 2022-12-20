<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="Viewdoctorbyclinic.aspx.cs" Inherits="clinic_management.Viewdoctorbyclinic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
     #viewdoctor{
            height:20%;
            text-align: center;
            position:relative;
            padding-top:3%;
              padding-bottom:3%;   
     }
     #viewdoctor h3{
          font-weight:bold;
     }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="viewdoctor">
           <h3 class="text-primary">
               View Doctors 
           </h3>
   </div>

    <div class="offset-md-2 row " style="margin-bottom:10px ;">
          <asp:TextBox ID="txtSearch" class="offset-md-2 col-md-4 rounded border-black" placeholder="Search Doctor" runat="server"></asp:TextBox>
          <asp:Button ID="btnsearch" class="offset-md-1 col-md-2 btn-primary rounded" runat="server" Text="Search" OnClick="btnsearch_Click"/>
        
    </div>
    <div class=" row"></div>
     <div class=" row">
            <div class="offset-md-4 col-md-7 align-content-center">
          
                <asp:Repeater ID="Repeater1" runat="server">
                   <ItemTemplate>
                       <div class="row col-md-8 border  mx-auto" style="margin-bottom:100px; padding-bottom:5%; padding-left:7%;  border-radius:4%; padding-top:30px;  background: linear-gradient(to right, white 10%,  cadetblue 90%); border-top-right-radius:30%;  margin-top:5%;">
                          
                         <div class="col-md-4  border-info mx-auto">
                               <asp:Image ImageUrl='<%# "../"+Eval("imgsource") %>' Width="120" Height="120"  runat="server"   CssClass="rounded-circle" />
                                 </div>

                           <div style="float:right; padding-left:20px; font-family:Arial;" class="offset-1 col-md-6 text-black  ">
                               
                               <h5><%# Eval("FirstName") %></h5>
                               <h5><%# Eval("LastName") %></h5>
                               <h5><%# Eval("Qualification") %></h5>
                               <h5><%# Eval("Specialization") %></h5>
                               <h5><%# Eval("ClinicName") %></h5>
                           </div>
                            
                           <div class="row mx-auto" style="margin-top:10px; margin-bottom: 30px; font-style:italic;  ">
                               <div class="col-md-12  ">
                                   <a href="DoctorAppointment.aspx?doctorid=<%#Eval("ProfileId")%>" class="btn btn-primary">Request An Appointment</a>
                               </div>
                           </div>

                          

                       </div>
                       
                       
                       
                    </ItemTemplate>
                </asp:Repeater>
       
         </div>
      

        </div>
    <div class="row" style="margin-bottom:20px"></div>
    
</asp:Content>
