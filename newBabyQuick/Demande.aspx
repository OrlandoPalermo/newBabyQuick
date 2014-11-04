<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Demande.aspx.cs" Inherits="newBabyQuick.PageBabysitter.Demande" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <div class="container" style="position: relative; top: 15px;">
        <div class="panel panel-primary">
            <div class="panel-heading"><h3>Les demandes reçues</h3></div>
            <div class="panel-body">
                <asp:DataGrid runat="server" CssClass="table table-bordered" ID="demandes" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundColumn DataField="DatePrevu" HeaderText="Date prévu"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DateFin" HeaderText="Date de fin"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
                </div>
            </div>
    </div>

    <script>
        $(function () {
            $("indexP_demandes tr").hover(function () {

            });
        });
    </script>
</asp:Content>
