<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="DemandesRecentes.aspx.cs" Inherits="newBabyQuick.DemandesRecentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
     <% 
        try
        {
            newBabyQuick.Membre m = (newBabyQuick.Membre)Session["membre"];

            if (m.Type != 1)
            {
                Response.Redirect("index.aspx");
            }
        }
        catch (Exception E)
        {
            Response.Redirect("index.aspx");
        }
       %>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Consulter ses demandes</h2>
            </div>
            <div class="panel-body table-responsive">
                <asp:DataGrid runat="server" ID="demandesRec" AutoGenerateColumns="false" CssClass="table table-bordered table-striped">
                    <Columns>
                        <asp:BoundColumn DataField="DateEmission" HeaderText="Date d'émission"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DatePrevu" HeaderText="Date prévu"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DateFin" HeaderText="Date de fin"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Accept" HeaderText="Accepté ?"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </div>
        </div>
     </div>

    <script>
        $(function () {
            $("#<%= demandesRec.ClientID %> tr:not(:eq(0))").each(function () {
                
                var background = "danger";

                if ($(this).children().eq(3).text() == "1") {
                    background = "success";
                    $(this).children().eq(3).text("Oui");
                } else {
                    $(this).children().eq(3).text("Non");
                }
                    
   
                $(this).addClass(background);
            });
        });
    </script>
</asp:Content>
