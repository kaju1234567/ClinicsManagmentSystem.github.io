<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="Viewpatientfordoctor.aspx.cs" Inherits="clinic_management.Viewpatientfordoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #viewpatient{
           height:10%;
            text-align: center;
            position:relative;
       
              padding-bottom:10%;
        }

      .btn-primary{

           margin-top: 2%;
       }

      
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="viewpatient">
           <div class="container login-container">
               <div class="row">
		                <div class="col-md-12">
                     <h3 style="text-align=center;margin-bottom:2%; font-weight:bold;" class="text-primary">PATIENTS</h3>
		                   <%-- <asp:Panel ID="Panel1" runat="server">
                           --%>  <br />
                                <div class="col-md-12">
                                      <div class="offset-md-5 col-md-8">
                                         <input style="margin-bottom:-18px;" id="txtDate" name="txtDate" placeholder="Date" class="form-control here col-md-12"  type="date" runat="server">
                                       </div><br /><br />
                                       <input type="button" name="btnSearchbydate" id="btnSearchbydate" value="Search" runat="server"  onserverclick="btnSearchbydate_ServerClick" class="offset-md-4 col-md-3  btn btn-primary"/>
                                    <%-- control must be inside form runat server otherwise value of input or selected(radio, checkbox,dropdownlist) will be refreshed --%>
                                       
                                  </div>
                               <br />

                                 <%--</asp:Panel>--%>
                                <div class=" col-md-12">
                                <div style="margin-top:40px;  color:darkblue; font-weight:bold"  class=" offset-md-4 col-md-8"><br />
                                  <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </div>
                              </div>
                                
                        
		                </div>
                   </div><br /><br />
           
            <div class="row">
                <div class="col-md-10  signup">
                    
                  
                        <div  class="offset-md-2 col-md-12">
                            <asp:GridView  ID="gridReports" runat="server"   ForeColor="#333333" CssClass="table table-responsive" GridLines="None" Height="262px" Width="979px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button  class="btn-info" BorderColor="#0099ff" BorderWidth="1px" Font-Bold="True" ID="btnViewhistory" OnClick="btnViewhistory_Click" runat="server" CausesValidation="false"  Text="History" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="CadetBlue" Font-Bold="True" ForeColor="black" BorderColor="#009999" BorderWidth="2px"  />
                                <PagerStyle  BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                            
                        </div>
                       

                    
                </div>
            </div>
     </div>
    
   </div>
</asp:Content>

