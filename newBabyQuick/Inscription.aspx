<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="newBabyQuick.Inscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <asp:Label runat="server" Text="" ID="test"></asp:Label>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Inscription</h2>
            </div>
            <div class="panel-body" style="padding: 30px;">
                <div class="row">
                    <div class="form-group">
                        <label for="<%= nom.ClientID %>" class="col-lg-2">Nom</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="nom" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="nom" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>

                        </div>
                        <label for="<%= prenom.ClientID %>" class="col-lg-2">Prenom</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="prenom" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="prenom" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label for="<%= password.ClientID %>" class="col-lg-2">Mot de passe</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" CssClass="form-control" ID="password"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="password" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="<%= gsm.ClientID %>" class="col-lg-2">Gsm</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="gsm" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="gsm" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="<%= email.ClientID %>" class="col-lg-2">Email</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="email" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="email" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                    <label class="col-lg-3">Type : </label>
                    <div class="btn-group" data-toggle="buttons">
                        <label for="<%= parents.ClientID %>" id="labelP" class="btn btn-default">
                            <asp:RadioButton runat="server" GroupName="typeMembre" ID="parents"/>Parents
                        </label>
                        <label for="<%= babysitter.ClientID %>" id="labelB" class="btn btn-default">
                            <asp:RadioButton runat="server" GroupName="typeMembre" ID="babysitter"/>Babysitter
                        </label>
                        </div>
                    </div>

                </div>
                <div class="row" id="nbEnfantsGroup" style="display: none;">
                    <div class="form-group">
                        <label for="<%= nbEnfants.ClientID %>" class="col-lg-2">Nombre d'enfants : </label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" CssClass="form-control" ID="nbEnfants" />
                        </div>
                    </div>
                </div>
                <div class="row" style="text-align: center;">
                    <asp:Button runat="server" CssClass="btn btn-success" Text="S'inscrire" />
                </div>
            </div>
            <asp:Label runat="server" ID="testAff"></asp:Label>
        </div>
    </div>



    <script>
        $(function () {
            $("#labelP").click(function () {
                    $("#nbEnfantsGroup").fadeIn();
            });

            $("#labelB").click(function () {
                $("#nbEnfantsGroup").fadeOut();
            });
        });
    </script>
</asp:Content>
