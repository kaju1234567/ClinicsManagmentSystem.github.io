<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Addtime.aspx.cs" Inherits="clinic_management.PanelReceptionist.Addtime" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css" />
    
    <style>
        #adddisease h3{
          
             font-weight:bold;
           margin-left:30%;
           margin-top:4%;
        }

        
        table {
            border:1px solid; 
            border-color:black;
            width:60%;
        
           
        }
        .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               padding-bottom:20%;
               margin-bottom:100px;
              
        
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:40%;
               
         }

    </style>

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <form runat="server">
   
    	 <div class="offset-md-4 col-md-5 ">
		    <div class="card" >  
		        <div id="adddisease"  class=" text-primary">
           <h3 >
               ADD TIME
           </h3>

               
		                <div class="offset-md-2 col-md-10">
		                    
                              <div >
                                <%--<label for="firstname" class="col-4 col-form-label">c</label>--%> 
                                <div>
                                    <div  class="text-left">
                                    <label> 24  Hrs TIME FORMAT:</label>
                                        </div>
                                  <input id="txtTime" name="txtTime" placeholder="Time (24 hrs)" class="form-control here"  type="text" runat="server">
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtTime" Display="Dynamic" ForeColor="Red"  runat="server"  ErrorMessage="Pattern is not valid...! " ValidationExpression="^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$"> </asp:RequiredFieldValidator>
                                </div>
                                  
                              </div>
                               <div class=" offset-md-2  col-md-10">
                               <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                                <div class="text-left" >
                                    <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                                 <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                                </div><br />
                              </div>
                              
                             
                                  <div class="col-md-10">
                                <div class="text-right">
                                  <button name="submit" id="btnsubmit"  class="btn btn-primary col-2"  runat="server" onserverclick="btnsubmit_ServerClick">Add</button>
                                </div>
                                      <br />
                              </div>
                                <asp:Label ID="lblMsg" runat="server" style="color:red"></asp:Label>
                            
		                </div>
		            </div>
		            </div>
                </div>
        
     
            

    <!--   View Time  -->
            <center>
    <div style="margin-bottom:8%" id="viewtime">
               
                   <asp:GridView  ID="gridviewtime" runat="server"  CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-responsive-md" Width="1040px">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       <Columns>
                           <asp:TemplateField HeaderText="Edit">
                               <ItemTemplate>
                                   <asp:Button ID="btnEdit" CssClass="btn btn-primary" runat="server" CausesValidation="false" CommandName=""  Text="Edit" OnClick="btnEdit_Click" />
                               </ItemTemplate>
                           </asp:TemplateField>
                          <%-- <asp:TemplateField HeaderText="Delete">
                               <ItemTemplate>
                                   <asp:Button ID="btnDelete" CssClass="btn btn-danger" runat="server" CausesValidation="false" CommandName="" Text="Delete" OnClick="btnDelete_Click"  />
                               </ItemTemplate>
                           </asp:TemplateField>--%>
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
        </center>
    </form>

</asp:Content>
