<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="newBabyQuick.Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading text-center">
                <h3>Etat de votre compte</h3>
            </div>

            <div class="panel-body">
                <% newBabyQuick.Membre m = Session["membre"] as newBabyQuick.Membre;
                   if (m.Type == 1)
                   { %>
                <div class="form-inline">
                    <label for="">Nombre d'enfants : </label>
                    <asp:TextBox runat="server" ID="NbEnfant" CssClass="form-control"></asp:TextBox>
                </div>
                <% }
                   else
                   { %>
                <!-- Préremplir les infos sur les dates -->
                <div class="form-inline">
                    <label for="<%= dateDispo.ClientID %>">Vous êtes disponible du : </label>
                    <asp:TextBox runat="server" ID="dateDispo" CssClass="form-control"></asp:TextBox>
                    <label for="<%= dateFinDispo.ClientID %>">jusqu'au : </label>
                    <asp:TextBox runat="server" ID="dateFinDispo" CssClass="form-control"></asp:TextBox>
                </div>
                <label for="">Statut du compte : </label>
                <% var glyphiconEtat = ""; if (((newBabyQuick.Babysitter)m).Confirm) { glyphiconEtat = "ok"; } else { glyphiconEtat = "remove"; } %>
                <span id="etat" class="glyphicon glyphicon-<%= glyphiconEtat %>"></span>
                <% } %>
            </div>
            <div class="panel-footer text-center">
                <asp:Button runat="server" ID="AcceptModification" Text="Editer le profil" CssClass="btn btn-success" />
            </div>
        </div>
    </div>
    <script>
        $(function () {
            $("#<%= dateDispo.ClientID %>").datepicker({
                dateFormat: "dd-mm-yy",
                onClose: function (selectedDate) {
                    $("#<%= dateFinDispo.ClientID %>").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#<%= dateFinDispo.ClientID %>").datepicker({
                dateFormat: "dd-mm-yy",
                onClose: function (selectedDate) {
                    $("#<%= dateDispo.ClientID %>").datepicker("option", "maxDate", selectedDate);
                }
            });
        });
    </script>
</asp:Content>
