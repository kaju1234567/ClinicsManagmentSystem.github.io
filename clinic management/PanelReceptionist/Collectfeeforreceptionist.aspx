<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Collectfeeforreceptionist.aspx.cs" Inherits="clinic_management.Collectfeeforreceptionist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #addservices h3{
           margin-top:5%; 
             font-weight:bold;
             text-decoration:underline;
        }

        .card {
            border: 2px solid;
            border-color: cadetblue;
            border-radius: 1%;
            margin-bottom:20%;
        
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:32%;
               
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
   <center>
   
    	 <div class=" offset-md-2 col-md-5 ">
		    <div class="card" >  
		        <div id="addservices"  class=" text-primary">
                    <h3 style="text-align=center;font-weight:bold;" class="text-primary">PAYMENT</h3>
		                    <asp:Panel ID="Panel1" runat="server">
                              
                                
                                
                                <div class=" offset-md-2 col-md-12">
                                 
                                    <input id="txtCollectfees" name="firstname" placeholder="Fees" class="form-control here col-md-10"  type="number" runat="server">
                                </div>
                                
                                  <%--<label for="firstname" class="col-4 col-form-label" style="font-weight:bold;">First Name</label> --%>
                              <div style="margin-top:10%; margin-left:15%;">     <button name="submit" type="submit" id="btnCollectfees" class="col-md-6  btn btn-primary" onserverclick="btnCollectfees_ServerClick" runat="server">Collect</button></div>
                     
                           </asp:Panel>    
                                
                             
                                <div>
                                   
                                <div class="offset-md-2 col-md-12">
                                  <input style="margin-bottom:30px;" id="txtDate" name="firstname" placeholder="Date" class="form-control here col-md-10"  type="date" runat="server">
                                 </div>
                                 
                                     <div style="margin-top:10%; margin-left:15%; padding-bottom:10%;"> 
                                    <button name="submit" type="submit" id="btnsearchwithdate" class="col-6  btn btn-primary" onserverclick="btnsearchwithdate_ServerClick" runat="server">Search</button>
               </div>               </div>
                               

                                
                                <div class="col-md-12">
                                <div  style="margin-top:30px; color:darkblue; font-weight:bold"  >
                                  <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </div>
                              </div>
                        
		                </div>
		            </div>
               </div>
              
                
               
              
                <div style="margin-bottom:15%; padding-bottom:50%;"  class="col-md-10 ">
                       
                            

                                <asp:GridView ID="gridPatients" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="834px">
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle  CssClass="bg-info" BackColor="#507CD1" Font-Bold="True" ForeColor="White"/>
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Collect Fees">
                                            <ItemTemplate>
                                                <asp:Button ID="btnFees"  runat="server" CausesValidation="false" CssClass="btn btn-primary" CommandName="" OnClick="btnFees_Click" Text="Collect Fees" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                    
                          
                       
                       

                    
              
        
            </form>
</asp:Content>
