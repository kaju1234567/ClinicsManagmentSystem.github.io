<%@ Page Title="" Language="C#" MasterPageFile="~/Patient.Master" AutoEventWireup="true" CodeBehind="DoctorAppointment.aspx.cs" Inherits="clinic_management.DoctorAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function myclick(btn) {
            var v = document.getElementById("date" + btn.id).value;
            var day = document.getElementById("day" + btn.id).innerText;
            var g1 = new Date();
            // (YYYY-MM-DD) 
            var g2 = new Date(v);
            if (g1.getTime() < g2.getTime())
                //alert("TimeTableId=" + btn.id + ",date :" + v);
                window.location.href = 'ConfirmAppointment.aspx?TimeTableId=' + btn.id + "&date=" + v + "&day=" + day;
            else
                alert("Selected Must be equal to or greater than current date....!");
        }

    </script>
   
    <style>
 .section-title{
      height:20%;
            text-align: left;
            position:relative;
            
    }
 .section-title h2{
       font-weight:bold;
             padding-left:45%;
 }
 .main{
     border:2px solid;
     border-color:cadetblue;
      border-radius:1%;
      margin-bottom:10%; 
     
     background: linear-gradient(to right, white 10%,  cadetblue 90%);
     border-top-right-radius:30%;
     height:385px;
 }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- End Why Us Section -->

     <section id="doctors" class="doctors">
      <div class="container">

        <div class="section-title ">
          <h2 class="text-primary">Doctor</h2>
          
        </div>

        <div class="row">
            <div  class="offset-md-4 col-md-7 align-content-center">
          
                <asp:Repeater ID="Repeater1" runat="server">
                   <ItemTemplate>
                       <div  class="main col-md-10 border  mx-auto">
                          
                          <div style="float:left; padding-left:80px; margin-top:8%; " class=" col-md-6  ">
                               <asp:Image ImageUrl='<%# "../"+Eval("imgsource") %>' Width="120" Height="110"  runat="server"   CssClass="rounded-circle" />
                             </div>

                           <div style="float:right; padding-left:10px; padding-right:20px; padding-top:1%;  font-style:italic" class=" col-md-6 text-black">
                               <h5><%# Eval("ClinicName") %></h5>
                               <h5><%# Eval("FirstName") %></h5>
                               <h5><%# Eval("Specialization") %></h5>
                               <h5><%# Eval("Qualification") %></h5>
                               <h5  id="<%# "day"+Eval("TimeTableId")%>"><%# Eval("day") %></h5>
                               <h5><%# Eval("ftime") %> - <%# Eval("ttime") %></h5> <br />                            
                               <h5 style="margin-left:-10%"><input type="date" name="date" id="<%# "date"+Eval("TimeTableId")%>"/></h5>
                               

                     

                           <!-- 
                               tt.`TimeTableId`,p.`ProfileId`,p.`FirstName`,p.`Specialization`,p.`Qualification`,
                                    p.`imgsource`,ft.`time`,tot.`time`,tt.`day`,c.`ClinicId`,c.`ClinicName`
                               
                               -->
                          
                         
                               <div class="col-md-6">
                                   <input type="button" style="margin-left:-45%;" value="Confirm Appointment "  id="<%# ""+Eval("TimeTableId")%>"  class="btn btn-primary" onclick="myclick(this);"/>
                                   
                                   <%--<a href="ConfirmAppointment.aspx?TimeTableId=<%#Eval("TimeTableId")%>" class="btn btn-primary" id="<%#Eval("TimeTableId")%>">Confirm Appointment</a>--%>
                               </div>
                           </div>

                       </div>
                       
                       
                       
                    </ItemTemplate>
                </asp:Repeater>
       
         </div>
      

        </div>

      </div>
    </section>
         
    
    <!-- ======= doctor profile details ======= -->
      
</asp:Content>
