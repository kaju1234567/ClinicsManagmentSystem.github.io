<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Viewpatientforreceptionist.aspx.cs" Inherits="clinic_management.Viewpatientforreceptionist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #viewpatient{
           height:20%;
            text-align: center;
            position:relative;
            padding-top:3%;
            top: -8px;
            left: 33px;
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
<form runat="server">
    <div id="viewpatient">
           <div class="container login-container">
           
               <div class="row">
		                <div class="col-md-12">
		                   <h3 style="text-align=center;margin-bottom:4%; font-weight:bold;" class="text-primary" >VIEW PATIENT APPOINTMENTS</h3>
                                <div >
                                      <div class="offset-md-3 col-md-6">
                                         <input style="margin-bottom:-18px; margin-bottom:7%;" id="txtDate" name="txtDate" placeholder="Date" class="form-control here"  type="date" runat="server">
                                       </div><br /></div>
                            
                                       <input  type="button" name="btnSearchbydate" id="btnSearchbydate" value="Search" runat="server"  onserverclick="btnSearchbydate_ServerClick"  class=" btn btn-primary  col-md-4"/>
                                    <%-- control must be inside form runat server otherwise value of input or selected(radio, checkbox,dropdownlist) will be refreshed --%>
                                       
                                  </div>
                               

                                 <%--</asp:Panel>--%>
                                <div class="col-md-12">
                                <div style="margin-top:40px; color:darkblue;font-weight:bold" >
                                  <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </div>
                              </div>
                                
                        
		                </div>
                   </div><br /><br />
           
                   <center>
                    
                        <div  class="col-md-12" style="padding-bottom:20%;">
                            <asp:GridView ID="gridReports" runat="server"  ForeColor="#333333" CssClass="table table-responsive" GridLines="None" Width="1165px" CellPadding="4">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Cance Appointment">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDltreport" CssClass="btn btn-danger" runat="server" CausesValidation="false" CommandName="" OnClick="btnDltreport_Click" Text="Cancel Appointment" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Accept Appointment">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAccept" CssClass="btn btn-primary" runat="server" CausesValidation="false" CommandName="" OnClick="btnAccept_Click" Text="Accept Appointment" />
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
                            
                        </div>
                       

                    
                </div>
            </div>
     </div>
    
   </div>
 </form>
</asp:Content>
