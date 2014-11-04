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
        <div class="panel panel-primary">
            <div class="panel panel-heading text-center"><h3>Faire une demande</h3></div> 
            <div class="panel panel-body">
                         <div class="col-lg-12">
                             <div class="row">
                                 <div class="col-lg-12">
                                     <asp:DataGrid ID="listBaby" runat ="server" AutoGenerateColumns="false" OnSelectedIndexChanged="listBaby_SelectedIndexChanged" CssClass="table table-bordered hide">
                                         <Columns>
                                            <asp:BoundColumn DataField="nom" HeaderText="Nom"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="prenom" HeaderText="Prénom"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="gsm" HeaderText="GSM"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="email" HeaderText="Email"></asp:BoundColumn>
                                        </Columns>
                                     </asp:DataGrid>
                                     </div>
                             </div>
                             <div class="row">
                                 <div class="col-lg-4">
                                     <div class="form-group">
                                         <div class="input-group">
                                             <div class="input-group-addon">Date désirée</div>
                                             <asp:TextBox runat="server" CssClass="form-control" ID="dateP" />
                                             
                                         </div>
                                     </div>
                                     
                                 </div>
                                 <div class="col-lg-offset-3 col-lg-4">
                                     <div class="form-group">
                                         <div class="input-group">
                                             <div class="input-group-addon">Date de fin</div>
                                             <asp:TextBox runat="server" CssClass="form-control" ID="dateF" />
                                             
                                         </div>
                                     </div>
                                     
                                 </div>
                             </div>

                             <select id="motifs" class="form-control">
                                 <option></option>
                                 <option>Enfant(s) malade(s)</option>
                                 <option>Enfant(s) blessé(s)</option>
                                 <option>Journée pédagogique</option>
                             </select>

                             <asp:TextBox runat="server" ID="listMotifs" Width="200" Height="100" CssClass="form-control"></asp:TextBox>
   
                         </div>
                                              
                
                <asp:TextBox runat="server" ID="mailSelected" CssClass="hide"></asp:TextBox>
                
             </div>
            <div class="panel panel-footer text-center">
                     <asp:Button runat="server" Text="Envoyer une demande" ID="submit_demande" CssClass="btn btn-default btn-success col-lg-12" OnClick="submit_demande_Click" />
                 
            </div>
         </div>
    </div>
    <script>
        $(document).ready(function () {
            $("#indexP_btnVousMeme").change(function () {
                $("#indexP_listBaby").removeClass("hide").addClass("show");
            });
            $("#indexP_btnInter").change(function () {
                $("#indexP_listBaby").removeClass("show").addClass("hide");
            });

            $("#indexP_listBaby td").click(function() {
                var emailBabysitter = $(this).parent().children().eq(3).text();
                var allTr = $(this).parent().parent().children();

                for (var i = 0; i < allTr.length; i++) {
                    $(allTr).eq(i).css("background-color", "snow");
                }
                $(this).parent().css("background-color", "gainsboro");

                $("#indexP_mailSelected").val(emailBabysitter);
            });

            $("#motifs").change(function () {
                $("#indexP_listMotifs").val($("#indexP_listMotifs").val() + "\n" + $(this).find(":selected").text());
            });

            $("#indexP_dateP").datepicker();
            $("#indexP_dateF").datepicker();
        });
    </script>
</asp:Content>


