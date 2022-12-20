<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="Viewclinicforpatient.aspx.cs" Inherits="clinic_management.Viewclinicforpatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #section-title{
           height:20%;
            text-align: center;
            position:relative;
            
        }
        #section-title h2{
             font-weight:bold;
             padding-left:25%;
        }
        .detail{
             border:2px solid;
     border-color:cadetblue;
      border-radius:1%;
      margin-bottom:10%; 
      margin-top:5%;
     background: linear-gradient(to right, white 10%,  cadetblue 90%);
     border-top-right-radius:30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <!-- ======= end of doctor profile details ======= -->
              <!-- ======= clinic details ======= -->
        <section id="departments" class="clinics">
      <div style="margin-top:-4%; padding-bottom:10%;" class="container">

        <div class="section-title">
          <h2 class="text-primary">Clinics</h2>
          <p></p>
        </div>
          
        <div class=" row">
            <div class=" offset-md-5 col-md-5">
          
                <div class="row">
                      <asp:TextBox ID="txtSearch" class=" col-md-12 rounded border-black" placeholder="Search Clinic "  runat="server"></asp:TextBox>
                        </div><br />
                <div class="row" style="margin-bottom:20px; margin-left:30px;">
                      <asp:Button ID="btnsearch" class="offset-md-1 col-md-8 btn-primary rounded" runat="server" Text="Search" OnClick="btnsearch_Click"/>
         </div><br />
            
                <asp:Repeater ID="Repeater2" runat="server">
                   <ItemTemplate>
                       <div class="detail border col-12  mx-auto" >
                           
                           
                          <div style="color:black; padding-top:5%; padding-bottom:10%; margin-left:120px; margin-top:35px;">
                               <h5><%# Eval("ClinicName") %></h5><br />
                               <h5><%# Eval("Contact") %></h5><br />
                               <h5><%# Eval("Address") %></h5>
                                   <br />                 
                           
                               <div class="col-md-12 offset-3 rounded "  >
                                   <a href="Viewdoctorbyclinic.aspx?ClinicId=<%#Eval("ClinicId")%>" class="btn btn-primary "  >Details</a>
                               </div>
                          <br />
                           </div>
                       </div>
                       
                       
                    </ItemTemplate>
                </asp:Repeater>
      
         </div>
      

        </div>

      </div>
    </section>
              <!-- ======= end of clinic details ======= -->
</asp:Content>
