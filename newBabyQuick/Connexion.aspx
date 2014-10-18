<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="newBabyQuick.Connexion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <div class="container">
         <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Connexion</h2>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="email" class="col-lg-4">Email</label>
                <div class="col-lg-8">
                    <asp:TextBox runat="server" ID="emailText" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="emailText" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="password" class="col-lg-4">Mot de passe</label>
                <div class="col-lg-8">
                    <asp:TextBox runat="server" ID="passwordText" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="passwordText" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
         <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Mémoriser le mot de passe ?</asp:Label>
                            </div>
                        </div>
                    </div>
        <div class="row">
            <asp:Button runat="server" Text="Se connecter" OnClick="Login" CssClass="btn btn-success text-center" />
        </div>
    </div>
  
</asp:Content>
