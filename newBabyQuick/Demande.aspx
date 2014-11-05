<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Demande.aspx.cs" Inherits="newBabyQuick.PageBabysitter.Demande" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <div class="container" style="position: relative; top: 15px;">
        <div class="panel panel-primary">
            <div class="panel-heading"><h3>Les demandes reçues</h3></div>
            <div class="panel-body">
                <asp:DataGrid runat="server" CssClass="table table-bordered" data-toggle="popover" data-placement="top" ID="demandes" AutoGenerateColumns="false">
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

            $("#indexP_demandes tr:not(:eq(0))").popover({
                html: true,
                content: function () {
                    $.get("Ajax/AjaxInfoDemande.aspx?info=9", function (data) {
                        $(".popover-content").html(data);
                    });
                },
                placement: "bottom",
                title: "Demande"
            });

            $("#indexP_demandes tr:not(:eq(0))").mouseover(function () {
                for (var i = 1; i < $(this).parent().children().length; i++) {
                    $(this).parent().children().eq(i).css("background-color", "snow");
                }

                $(this).css("background-color", "gainsboro");
                $(this).css("cursor", "pointer");
            });

            
        });
    </script>
</asp:Content>
