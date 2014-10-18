<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="newBabyQuick.Inscription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <asp:Label runat="server" Text="" ID="test"></asp:Label>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Inscription</h2>
            </div>
        </div>
        
        <div class="row">
            <div class="form-group">
                <label for="nom" class="col-lg-2">Nom</label>
                    <div class="col-lg-4">
                        <asp:TextBox runat="server" ID="nom" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="nom" CssClass="text-danger" ErrorMessage="Le champ est obligatoire" ></asp:RequiredFieldValidator>
               
                    </div>
                <label for="prenom" class="col-lg-2">Prenom</label>
                    <div class="col-lg-4">
                        <asp:TextBox runat="server" id="prenom" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="prenom" CssClass="text-danger" ErrorMessage="Le champ est obligatoire" ></asp:RequiredFieldValidator>
                    </div>
             </div>
         </div>

        <div class="row">
            <div class="form-group">
                <label for="password" class="col-lg-2">Mot de passe</label>
                <div class="col-lg-4">
                    <asp:TextBox runat="server" CssClass="form-control" ID="password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="password" CssClass="text-danger" ErrorMessage="Le champ est obligatoire" ></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="gsm" class="col-lg-2">Gsm</label>
                <div class="col-lg-4">
                    <asp:TextBox runat="server" id="gsm" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="gsm" CssClass="text-danger" ErrorMessage="Le champ est obligatoire" ></asp:RequiredFieldValidator>
               
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label for="email" class="col-lg-2">Email</label>
                <div class="col-lg-4">
                    <asp:TextBox runat="server" id="email" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="email" CssClass="text-danger" ErrorMessage="Le champ est obligatoire" ></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="row">
            <asp:RadioButton runat="server" Text="Parents" GroupName="typeMembre" ID="parents" CssClass="lg-col-3"/>
            <asp:RadioButton runat="server" Text="Babysitter" GroupName="typeMembre" ID="babysitter" CssClass="lg-col-3" />
        </div>
        <div class="row" id="nbEnfantsGroup" style="display: none;">
            <div class="form-group">
                <label for="nbEnfants" class="col-lg-2">Nombre d'enfants : </label>
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
    
    <script>
        $(function () {
            $("input[id$=parents]").click(function () {
                var type = $(this).val();

                if (type == "parents")
                    $("#nbEnfantsGroup").fadeIn();
                else
                    $("#nbEnfantsGroup").fadeOut();
                
            });

            
        });
    </script>
</asp:Content>
