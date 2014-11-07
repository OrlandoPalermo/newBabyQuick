<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Demande.aspx.cs" Inherits="newBabyQuick.PageBabysitter.Demande" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <style>

    </style>
    <div class="container" style="position: relative; top: 15px;">
        <div class="panel panel-primary">
            <div class="panel-heading"><h3>Les demandes reçues</h3></div>
            <div class="panel-body">
                <asp:GridView runat="server" CssClass="table table-bordered" data-placement="top" ID="demandesG" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="id" HeaderStyle-CssClass="hidden"><ItemStyle CssClass="hidden" /></asp:BoundField>
                        <asp:BoundField DataField="DatePrevu" HeaderText="Date prévu"></asp:BoundField>
                        <asp:BoundField DataField="DateFin" HeaderText="Date de fin"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:TextBox runat="server" ID="IdSelected"></asp:TextBox>
                </div>
            </div>
    </div>
    <script type="text/javascript">
        $(function () {
            var indexRowSelected = 0;
            var oldIndexSelected = 0;

            $("#indexP_demandesG tr:not(:eq(0))").popover({
                html: true,
                content: function () {
                 
                    indexRowSelected = $("#indexP_demandesG tr").index(this);
                    var idSelected = $(this).children().eq(0).text();

                    var popovers = $(".popover");

                    $(".popover:visible").remove();

                    $.get("Ajax/AjaxInfoDemande.aspx?info=" + idSelected, function (data) {
                        $(".popover-content").html(data + '<div class="text-center"><asp:Button runat="server" Text="Accepter" CssClass="btn btn-success" ID="Accept" style="margin-right: 1px; margin-left: 1px;" /><asp:Button runat="server" Text="Refuser" CssClass="btn btn-danger" ID="Refuser" style="margin-right: 1px; margin-left: 1px;" /></div>');

                        $("#indexP_Accept").click(function (e) {
                            e.preventDefault();

                            $.get("Ajax/AjaxInfoDemande?info=" + idSelected + "&accept=1", function () {
                                $(".popover-content").html("<div class='alert alert-success'>Cette demande a été accepté</div>");
                                setTimeout(function () {
                                    $(".popover").slideUp();

                                    setTimeout(function () {
                                        $("#indexP_demandesG tr").eq(indexRowSelected).fadeOut();
                                    }, 500);
                                }, 1500);

                            });
                        });

                        $("#indexP_Refuser").click(function (e) {
                            e.preventDefault();
                            $.get("Ajax/AjaxInfoDemande?info=" + idSelected + "&refuser=1", function () {
                                $(".popover-content").html("<div class='alert alert-primary'>Cette demande a été refusée</div>");
                                setTimeout(function () {
                                    $(".popover").slideUp();

                                    setTimeout(function () {
                                        $("#indexP_demandesG tr").eq(indexRowSelected).fadeOut();
                                    }, 500);
                                }, 1500);
                            });
                        });
                    });
                    oldIndexSelected = indexRowSelected;
                },
                placement: "bottom",
                title: "Demande"
            });

            $("#indexP_demandesG tr:not(:eq(0))").mouseover(function () {
                for (var i = 1; i < $(this).parent().children().length; i++) {
                    $(this).parent().children().eq(i).css("background-color", "snow");
                }

                $(this).css("background-color", "gainsboro");
                $(this).css("cursor", "pointer");
            });

            
        });
    </script>
</asp:Content>
