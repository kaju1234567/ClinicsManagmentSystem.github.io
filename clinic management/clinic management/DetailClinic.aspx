<%@ Page Title="" Language="C#" MasterPageFile="~/homemaster.Master" AutoEventWireup="true" CodeBehind="DetailClinic.aspx.cs" Inherits="clinic_management.DetailClinic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        #viewdoctor{
           height:20%;
            text-align: center;
            position:relative;
            padding-top:3%;
              padding-bottom:3%;
        }

         #btnsearch {
            margin-left:40px;
         
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
     <div id="viewdoctor">
           <h2>
               View Doctors 
           </h2>
   </div>

    <div class="row" style="margin-bottom:20px">
          <asp:TextBox ID="txtSearch" class="offset-2 col-md-4" placeholder="Search Doctor "  runat="server"></asp:TextBox>
          <asp:Button ID="btnsearch" class="offset-md-1 col-md-2" runat="server" Text="Search" OnClick="btnsearch_Click"/>
        
    </div>
    <div class="row"></div>
     <div class="row">
            <div class="offset-2 col-md-8 align-content-center">
          
                <asp:Repeater ID="Repeater1" runat="server">
                   <ItemTemplate>
                       <div class="row col-md-8 border  mx-auto" style="margin-bottom:30px; border-radius:4%; padding-top:30px; background-color: lightblue">
                          
                          <div class="col-md-4  border-info mx-auto">
                               <asp:Image ImageUrl='<%# Eval("imgsource") %>' Width="120" Height="120"  runat="server"   CssClass="rounded-circle" />
                                 </div>

                           <div style="float:right; padding-left:20px;  font-style:italic" class="offset-1 col-md-6 text-primary  ">
                               <h5><%# Eval("FirstName") %></h5>
                               <h5><%# Eval("LastName") %></h5>
                               <h5><%# Eval("Qualification") %></h5>
                               <h5><%# Eval("Specialization") %></h5>
                           </div>
                            
                           <div class="row mx-auto" style="margin-top:10px; margin-bottom: 30px; font-style:italic;  ">
                               <div class="col-md-12  ">
                                   <a href="Patient/DoctorAppointment.aspx?doctorid=<%#Eval("ProfileId")%>" class="btn btn-primary">Request An Appointment</a>
                               </div>
                           </div>

                          

                       </div>
                       
                       
                       
                    </ItemTemplate>
                </asp:Repeater>
       
         </div>
      

        </div>
    <div class="row" style="margin-bottom:20px"></div>
        </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
