<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor.Master" AutoEventWireup="true" CodeBehind="PatientPrescription.aspx.cs" Inherits="clinic_management.PatientPrescription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top:5px; margin-bottom:10%;">
		<div class="col-md-12">
		    <form>
                <div class="form-group row" >
                    <div class="col-12 text-center text-primary">
                        <h3 style="text-align:center; margin-bottom:2%;  font-weight:bold" class="text-primary">DETAILS</h3>
                    </div>
                </div>
                <div class="form-group row">
                <label for="firstname" class="offset-md-2 col-2 col-form-label" style="font-weight:bold;">PRESCRIPTION</label> 
                <div class="col-6">
                    <textarea style="border-radius:4%; border:2px solid  gray" rows="4" id="txtPrescription" name="name" placeholder="Prescription" class="form-control here" type="text" runat="server"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                <label for="lastname" class="offset-md-2 col-2 col-form-label" style="font-weight:bold;">DESCRIPTION</label> 
                    <div class="col-6">
                        <textarea style="border-radius:4%; border:2px solid  gray" rows="4" id="txtDescritpion" name="name" placeholder="Description" class="form-control here" type="text" runat="server"></textarea>
                    </div>
                </div>
                               
                <div class="form-group row">
                <div class="offset-6 col-8">
                    <button name="submit" type="submit" id="btnSubmit" onserverclick="btnSubmit_ServerClick"   class="btn btn-primary"  runat="server">Submit</button>
                </div>
                </div>

                <div class="form-group row">
                <div class="offset-4 col-6">
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
                </div>
            </form>
		</div>
	</div>
		            
                
    


</asp:Content>
