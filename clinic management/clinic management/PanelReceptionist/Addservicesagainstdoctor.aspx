<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Addservicesagainstdoctor.aspx.cs" Inherits="clinic_management.Addservicesagainstdoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        #addservices h3{
           margin-top:5%; 
             padding-bottom:30px;
             font-weight:bold;
             text-decoration:underline;
        }


        .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:20%; padding-bottom:10%;
               margin-top:5%;
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
            
               
         }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
         <center>
  
    	 <div class="offset-md-2 col-md-7 ">
		    <div class="card" >  
		        <div id="addservices"  class=" text-primary" >
           <h3 >
               ADD DOCTOR SERVICES
           </h3>

                   <center>
                    <h3 align="center">Doctor:<asp:Label ID="lbldoctor"  runat="server" Text="" CssClass="text-primary"></asp:Label></h3></center>
                    <div>
                        <div  class="offset-md-2 col-md-9 bg-white">
                            <asp:CheckBoxList ID="chkList" runat="server" CssClass="table table-bordered">

                            </asp:CheckBoxList> 
                           </div> 
                        </div><br /><br />
                    <div style="color:white; margin-left:100px;">
                        <asp:Button ID="btnSave"  class="col-md-3 bg-primary "  style="height:40px; color:white;"  runat="server" Text="SAVE"  OnClick="btnSave_Click"/>
                    </div>
                    <br />
                       
                    <div class="offset-md-2 col-md-10" style="color:red;" >
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                    
                    
                </div>
            </div>
           </div>
    

        </form>
</asp:Content>
