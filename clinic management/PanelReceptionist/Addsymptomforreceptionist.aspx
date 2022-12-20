<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist.Master" AutoEventWireup="true" CodeBehind="Addsymptomforreceptionist.aspx.cs" Inherits="clinic_management.Addsymptomforreceptionist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        #addsymptoms h3{
             margin-top:5%; 
             padding-bottom:30px;
             font-weight:bold;
             text-decoration:underline;
         }
         .card{
              border:2px solid; 
              border-color:cadetblue;
               border-radius:1%;
               margin-bottom:10%; 
               margin-top:5%;
               background: linear-gradient(to right, white 10%,  cadetblue 90%);
               border-top-right-radius:30%;
               
         }
         .form-control{
             border-radius:10px;
             border: 2px solid gray;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form runat="server">
                  <div class="offset-md-4 col-md-6 ">
		    <div class="card" >  
     <div id="addsymptoms" class=" text-primary">
           <h3 class=" offset-md-3">
               Add Symptoms 
           </h3>

     
		    
		            <div class="offset-md-2 col-md-10">
                    <div  style="margin-top:3%; ">
                        <input id="txtSymptoms" name="txtSymptoms" placeholder="Symptoms" class="form-control here"  type="text" runat="server"><br />
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtSymptoms" runat="server" ErrorMessage="Mimimum 3 letter are allowed and numeric and specail character are not allowed without dot.!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                               
                              
                        </div>
                        
                    </div>
                  
                <div class="offset-md-2 col-md-10">
                        <div>
                            <input id="txtDecription" name="txtDecription" placeholder="Description" class="form-control here"  type="text" runat="server">
                      <br />   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtDecription" runat="server" ErrorMessage="Mimimum 3 letter are allowed and numeric and specail character are not allowed without dot.!" ForeColor="Red" ValidationExpression="^[A-Za-z. ]{3,}$"></asp:RegularExpressionValidator>
                               
                         
                           </div>
                    
                    </div>
                    <div class="offset-md-2 col-md-10">
                    <%-- <label for="username" class="col-4 col-form-label">UserName</label> --%>
                    <div>
                        <asp:CheckBox ID="chkIsactive" runat="server" class="form-control here" Text="Isactive" ></asp:CheckBox>
                        <%-- <input id="chckIsactive"class="form-control here" type="checkbox" runat="server">--%>
                    </div>
                         <br /> 
                    </div>
                    <div class="col-md-10">
                    <div class="text-right" >
                        <button name="submit" id="btnsubmit"  class="btn btn-primary"  runat="server" onserverclick="btnsubmit_ServerClick">Add</button>
                    </div>
                         <br />  <br /> 
                    </div>
                    <asp:Label ID="lblMsg" runat="server" style="color:red"></asp:Label>
                 </div>           
		    </div>
		</div>
    <center>   <div class="row" style="padding-bottom:20%;">
            <div class="offset-1 col-md-10 align-content-center">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1144px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CausesValidation="false" CommandName="" OnClick="btnEdit_Click" Text="Edit" />
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

   </div></center>
</form>

</asp:Content>
