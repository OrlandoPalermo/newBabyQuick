<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="newBabyQuick.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="Server">

    <asp:LoginView runat="server" ViewStateMode="Disabled">
        <AnonymousTemplate>
            <style>
                html, body {
                    height: 100%;
                }

                .carousel, .item, .active {
                    height: 100%;
                }

                .carousel-inner {
                    height: 100%;
                }

                .fill {
                    width: 100%;
                    height: 100%;
                    background-position: center;
                    background-size: cover;
                }
            </style>
            <div id="container fill" style="height: 100%;">
                <div id="carousel" class="carousel slide" data-ride="carousel" style="margin-top: -20px; margin-bottom: 40px;">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel" data-slide-to="1"></li>
                        <li data-target="#carousel" data-slide-to="2"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="fill" style="height: 100%;" src="Images/babysitter-index-1.jpeg" alt="city" />
                            <div class="carousel-caption" style="top: 0">
                                <h3>Un service de babysitting de qualité</h3>
                                <p>Prenez une pause, appelez un babysitter et protiftez de votre soirée.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img class="fill"  style="height: 100%;" src="Images/babysitter-index-2.png" alt="city" />
                            <div class="carousel-caption" style="top: 0">
                                <h3>Une équipe de babysitter en forme !</h3>
                                <p>Nous vous proposons une base de données complète pour trouver un babysitter !</p>
                            </div>
                        </div>
                        <div class="item">
                            <img class="fill"  style="height: 100%;" src="Images/babysitter-index-3.jpeg" alt="city" />
                            <div class="carousel-caption" style="top: 0">
                                <h3>Qu'attendez vous ?</h3>
                                <p>Inscrivez-vous gratuitement et profitez de nos services !</p>
                            </div>
                        </div>

                    </div>
                    <a class="left carousel-control" href="#carousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <%
                newBabyQuick.Membre m = Session["membre"] as newBabyQuick.Membre;
                if (m != null)
                {
                    if (m != null && m.Type == 1)
                    { %>
            <div class="container">
                <div class="row" style="background-color: snow; position: relative; top: 50px; border: 2px solid grey; border-radius: 10px; padding: 1%;">
                    <h2 class="col-lg-12 page-header text-center">Les options disponibles :</h2>
                    <div class="row text-center">
                        <div class="col-md-6 col-sm-6">
                            <a href="Search.aspx" class="btn btn-default btn-success btn-lg">Rechercher un babysitter</a>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <a href="DemandesRecentes.aspx" class="btn btn-default btn-warning btn-lg">Voir les demandes récentes</a>
                        </div>
                    </div>

                </div>
            </div>

            <% }
                    else if (m.Type == 2)
                    {%>
            <div class="container" style="position: relative; top: 15px;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>Panneau babysitter</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6"><a href="Demande.aspx" class="btn btn-default">Consulter ses demandes</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <% }
                }
                else
                {
                    Session["errorSession"] = 1;
                    Response.Redirect("index.aspx");
                } %>
        </LoggedInTemplate>
    </asp:LoginView>

</asp:Content>

