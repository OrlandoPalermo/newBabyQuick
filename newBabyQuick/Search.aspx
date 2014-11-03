<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="newBabyQuick.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <div class="container">
        <h2 class="page-header">Rechercher un babysitter</h2>
        <div class="row alert alert-danger" style=" padding: 1%;">
            <strong>Avant de commencer, voulez-vous rechercher votre babysitter :</strong>
            <div class="row">
                <asp:RadioButton runat="server" GroupName="option" Text="par vous même" CssClass="col-lg-6" ID="btnVousMeme"/>
                <asp:RadioButton runat="server" GroupName="option" Text="par un intermédiaire (payant)" CssClass="col-lg-6" ID="btnInter" />
            </div>
        </div>
        <div class="row" style=" background: rgba(255, 255, 255, 0.9); position: relative; top: 17px; padding: 2%; border: 1px solid gainsboro; ">
             <div class="row">
                 <div class="row">
                     
                     <p class="col-lg-12">
                         restant du formulaire
                         <p id="tabBaby">
                             <asp:DataGrid style="display:none;" ID ="listBaby" runat ="server" AutoGenerateColumns="false" OnSelectedIndexChanged="listBaby_SelectedIndexChanged">
                                 <Columns>
                                    <asp:BoundColumn DataField="nom" HeaderText="Nom"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="prenom" HeaderText="Prénom"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="gsm" HeaderText="GSM"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="email" HeaderText="Email"></asp:BoundColumn>
                                </Columns>
                             </asp:DataGrid>
                         </p>
                         
                     </p>
                     
                 </div>
             
                 <div class="row text-center">
                     <asp:Button runat="server" Text="Envoyer une demande" CssClass="btn btn-default btn-success col-lg-12" />
                 </div>
             </div>
         </div>
    </div>
    <script>
        $(document).ready(function () {
            $("#indexP_btnVousMeme").change(function () {
                $("#indexP_listBaby").show();
            });
            $("#indexP_btnInter").change(function () {
                $("#indexP_listBaby").hide();
            });
            
        });
    </script>
</asp:Content>


