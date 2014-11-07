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
                        <asp:BoundColumn DataField="Id" Visible="false"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DatePrevu" HeaderText="Date prévu"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DateFin" HeaderText="Date de fin"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
                </div>
            </div>
    </div>
    <asp:TextBox runat="server" ID="Test" Text="dd"></asp:TextBox>
    <script type="text/javascript">
       /* $(function () {
            var indexRowSelected = 0;

            $("#indexP_demandes tr:not(:eq(0))").click(function () {
                indexRowSelected = $("#indexP_demandes tr").index(this);

                $("#indexP_demandes tr:eq(" + indexRowSelected + ")").popover({
                    html: true,
                    content: function () {
                        $.get("Ajax/AjaxInfoDemande.aspx?info=", function (data) {
                            $(".popover-content").html(data + '<div class="text-center"><asp:Button runat="server" Text="Accepter" CssClass="btn btn-success" ID="Accept" style="margin-right: 1px; margin-left: 1px;" /><asp:Button runat="server" Text="Refuser" CssClass="btn btn-danger" ID="Refuser" style="margin-right: 1px; margin-left: 1px;" /></div>');

                            $("#indexP_Accept").click(function (e) {
                                e.preventDefault();

                                $.get("Ajax/AjaxInfoDemande?info=9&accept=1", function () {
                                    $(".popover-content").html("<div class='alert alert-success'>Cette demande a été accepté</div>");
                                    setTimeout(function () {
                                        $(".popover").slideUp();

                                        setTimeout(function () {
                                            $("#indexP_demandes tr").eq(indexRowSelected).fadeOut();
                                        }, 500);
                                    }, 1500);

                                });
                            });

                            $("#indexP_Refuser").click(function (e) {
                                e.preventDefault();
                                $.get("Ajax/AjaxInfoDemande?info=9&refuser=1", function () {
                                    $(".popover-content").html("<div class='alert alert-primary'>Cette demande a été refusée</div>");
                                    setTimeout(function () {
                                        $(".popover").slideUp();

                                        setTimeout(function () {
                                            $("#indexP_demandes tr").eq(indexRowSelected).fadeOut();
                                        }, 500);
                                    }, 1500);
                                });
                            });
                        });
                    },
                    placement: "bottom",
                    title: "Demande"
                });
            });

            

            $("#indexP_demandes tr:not(:eq(0))").mouseover(function () {
                for (var i = 1; i < $(this).parent().children().length; i++) {
                    $(this).parent().children().eq(i).css("background-color", "snow");
                }

                $(this).css("background-color", "gainsboro");
                $(this).css("cursor", "pointer");
            });

            
        });*/
    </script>
</asp:Content>
