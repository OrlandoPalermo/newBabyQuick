<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="newBabyQuick.Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <asp:Label runat="server" ID="NomPrenom"></asp:Label>
            </div>

            <div class="panel-body">
                <p>
                    <div id="boxParents">
                        <div class="form-group form-inline">
                            <label for="">Nombre d'enfants : </label>
                            <asp:TextBox runat="server" ID="NbEnfant" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div id="boxBabysitter">
                        <div class="form-group form-inline">
                            <label for="<%= dateDispo.ClientID %>">Vous êtes disponible du : </label>
                            <asp:TextBox runat="server" ID="dateDispo" CssClass="form-control"></asp:TextBox>
                            <label for="<%= dateFinDispo.ClientID %>">jusqu'au : </label>
                            <asp:TextBox runat="server" ID="dateFinDispo" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </p>
            </div>

        </div>
    </div>

</asp:Content>
