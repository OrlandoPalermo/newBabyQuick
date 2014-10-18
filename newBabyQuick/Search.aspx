<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="newBabyQuick.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <div class="container">
        <h2 class="page-header">Rechercher un babysitter</h2>
        <div class="row alert alert-danger" style=" padding: 1%;">
            <strong>Avant de commencer, voulez-vous rechercher votre babysitter :</strong>
            <div class="row">
                <asp:RadioButton runat="server" GroupName="option" Text="par vous même" CssClass="col-lg-6"/>
                <asp:RadioButton runat="server" GroupName="option" Text="par un intermédiaire (payant)" CssClass="col-lg-6" />
            </div>
        </div>
        <div class="row" style=" background: rgba(255, 255, 255, 0.9); position: relative; top: 17px; padding: 2%; border: 1px solid gainsboro; ">
             <div class="row">
                 <div class="row">
                     
                     <p class="col-lg-12">Restant du formulaire</p>
                 </div>
             
                 <div class="row text-center">
                     <asp:Button runat="server" Text="Valider" CssClass="btn btn-default btn-success col-lg-12" />
                 </div>
             </div>
         </div>
    </div>
</asp:Content>
