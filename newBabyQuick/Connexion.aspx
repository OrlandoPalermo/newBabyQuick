<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="newBabyQuick.Connexion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
        <% 
        try
        {
            newBabyQuick.Membre m = (newBabyQuick.Membre)Session["membre"];

            if (m != null)
            {
                Response.Redirect("index.aspx");
            }
        }
        catch (Exception E)
        {
            
        }
       %>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Connexion</h2>
            </div>
            <div class="panel-body" style="padding: 30px;">
                <div class="row">
                    <div class="form-group">
                        <label for="<%= emailText.ClientID %>" class="col-lg-4">Email</label>
                        <div class="col-lg-8">
                            <asp:TextBox runat="server" ID="emailText" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="emailText" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="<%= passwordText.ClientID %>" class="col-lg-4">Mot de passe</label>
                        <div class="col-lg-8">
                            <asp:TextBox runat="server" ID="passwordText" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="passwordText" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <asp:Button runat="server" Text="Se connecter" OnClick="Login" CssClass="btn btn-success text-center" />
                </div>
            </div>
        </div>


    </div>

</asp:Content>
