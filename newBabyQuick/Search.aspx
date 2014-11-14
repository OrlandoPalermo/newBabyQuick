<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="newBabyQuick.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <style>
        .freeOption {
            display: none;
        }
    </style>
    <div class="container">
        <h2 class="page-header">Rechercher un babysitter</h2>
        <div class="row alert alert-danger" style="padding: 1%;">
            <strong>Avant de commencer, voulez-vous rechercher votre babysitter :</strong>
            <div class="row">
                <asp:RadioButton runat="server" GroupName="option" Text="par vous même" CssClass="col-lg-6" ID="btnVousMeme" />
                <asp:RadioButton runat="server" GroupName="option" Text="par un intermédiaire (payant)" CssClass="col-lg-6" ID="btnInter" />
            </div>
        </div>
        <div class="panel panel-primary" id="panelDemande" style="display: none;">
            <div class="panel panel-heading text-center">
                <h3>Faire une demande</h3>
            </div>
            <div class="panel panel-body">

                <div class="infoDemande" style="padding: 15px;">
                <div class="row">
                    <div class="form-group">
                        <label for="<%= dateP.ClientID %>" class="col-md-3">Vous rechercher un babysitter pour le </label>
                        <asp:TextBox runat="server" ID="dateP" CssClass="form-control col-md-2"></asp:TextBox>
                        <label for="<%= dateF.ClientID %>" class="col-md-2">jusqu'au : </label>
                        <asp:TextBox runat="server" ID="dateF" CssClass="form-control col-md-2"></asp:TextBox>
                    </div>
                </div>


                <asp:UpdatePanel runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="envoieDates" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <div class="row">
                            <div class="form-group">
                                <asp:Button runat="server" ID="envoieDates" CssClass="btn btn-default freeOption col-md-offset-5" Text="Générer la liste des babysitters" OnClick="envoieDates_Click" />
                            </div>
                            
                        </div>
                        
                        <div class="row">
                            <div class="form-group">
                                <label for="" class="col-md-3">Votre adresse : </label><asp:TextBox runat="server" ID="AdresseParent" Enabled="false" CssClass="form-control col-lg-4"></asp:TextBox>
                            </div>
                            <div class="col-lg-12">
                                <asp:DataGrid ID="listBaby" runat="server" Visible="true" AutoGenerateColumns="false" OnSelectedIndexChanged="listBaby_SelectedIndexChanged" CssClass="table table-bordered">
                                    <Columns>
                                        <asp:BoundColumn DataField="nom" HeaderText="Nom"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="prenom" HeaderText="Prénom"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="gsm" HeaderText="GSM"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="email" HeaderText="Email"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="lieux" HeaderText="Adresse"></asp:BoundColumn>
                                    </Columns>
                                </asp:DataGrid>

                            </div>
                            <div class="alert alert-info freeOption" id="babysitterMasque"></div>
                        </div>
                    </ContentTemplate>

                </asp:UpdatePanel>

                <div class="row">
                    <div class="form-group">
                        <label for="motifs" class="col-lg-3">Informations supplémentaires : </label>
                        <select id="motifs" class="form-control">
                            <option></option>
                            <option>Enfant(s) malade(s)</option>
                            <option>Enfant(s) blessé(s)</option>
                            <option>Journée pédagogique</option>
                        </select>
                    </div>
                </div>
                
                <asp:TextBox runat="server" TextMode="MultiLine" ID="listMotifs" Width="200" Height="100" CssClass="form-control col-md-offset-3 col-md-3"></asp:TextBox>
            </div>
                </div>
            <asp:TextBox runat="server" ID="mailSelected" CssClass="hide"></asp:TextBox>
            <div class="panel-footer text-center">
                <asp:Button runat="server" Text="Envoyer une demande" ID="submit_demande" CssClass="btn btn-default btn-success col-lg-12" OnClick="submit_demande_Click" />

            </div>
        </div>

    </div>
    <script>
        $(document).ready(function () {
            $("#indexP_btnVousMeme").change(function () {
                $("#indexP_listBaby").removeClass("hide").addClass("show");
                $("#panelDemande").show(500);
                $(".freeOption").show();
            });
            $("#indexP_btnInter").change(function () {
                $("#indexP_listBaby").removeClass("show").addClass("hide");
                $("#panelDemande").show(500);
                $(".freeOption").hide();
            });


            $("#motifs").change(function () {
                $("#indexP_listMotifs").val($("#indexP_listMotifs").val() + "\n" + $(this).find(":selected").text());
            });


            $("#<%= dateP.ClientID %>").datepicker({
                dateFormat: "dd-mm-yy",
                onClose: function (selectedDate) {
                    $("#<%= dateF.ClientID %>").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#<%= dateF.ClientID %>").datepicker({
                dateFormat: "dd-mm-yy",
                onClose: function (selectedDate) {
                    $("#<%= dateP.ClientID %>").datepicker("option", "maxDate", selectedDate);
                }
            });


        });
    </script>
</asp:Content>


