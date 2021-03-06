﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Demande.aspx.cs" Inherits="newBabyQuick.PageBabysitter.Demande" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <% 
        try
        {
            newBabyQuick.Membre m = (newBabyQuick.Membre)Session["membre"];

            if (m.Type != 2)
            {
                Response.Redirect("index.aspx");
            }
        }
        catch (Exception E)
        {
            Response.Redirect("index.aspx");
        }
       %>
    <style>
    </style>
    <div class="container" style="position: relative; top: 15px; margin-bottom: 60px;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3>Les demandes reçues</h3>
            </div>
            <div class="panel-body">
                <div id="notificationsDemandes"></div>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Timer runat="server" ID="tickDemandes" OnTick="tickDemandes_Tick" Interval="20000"></asp:Timer>
                        <asp:GridView runat="server" CssClass="table table-bordered" data-placement="top" ID="demandesG" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="id" HeaderStyle-CssClass="hidden">
                                    <ItemStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DatePrevu" HeaderText="Date prévu"></asp:BoundField>
                                <asp:BoundField DataField="DateFin" HeaderText="Date de fin"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <div id="controlDemande" class="hidden">
                            
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tickDemandes" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <script type="text/javascript">

 
    </script>
</asp:Content>
