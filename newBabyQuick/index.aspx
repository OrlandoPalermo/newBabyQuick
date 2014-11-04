<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="newBabyQuick.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="indexP" Runat="Server">

    <asp:LoginView runat="server" ViewStateMode="Disabled">
            <AnonymousTemplate>
                 <div class="container">
                    <div class="row" style="line-height: 200px;">
                        <div class="col-lg-12 text-center">
                            <div class="row">
                                <div class="col-lg-12"><h1 id="titreIndex">BABYQUICK</h1></div>
                                <div class="col-lg-12"><h4>Je suis une magnifique phrase !</h4></div>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center" id="grille_presentation">
                        <div class="col-lg-4">
                            <div class="row">
                                <div class="col-lg-12"><img src="https://wiki.jvflux.com/images/thumb/4/47/Lamasticot.PNG/300px-Lamasticot.PNG" class="img-circle" /></div>
                                <div class="col-lg-12 description_image"><h4>Je suis une magnifique phrase !</h4></div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="row">
                                <div class="col-lg-12"><img src="https://wiki.jvflux.com/images/thumb/4/47/Lamasticot.PNG/300px-Lamasticot.PNG" class="img-circle" /></div>
                                <div class="col-lg-12 description_image"><h4>Je suis une magnifique phrase !</h4></div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="row">
                                <div class="col-lg-12"><img src="https://wiki.jvflux.com/images/thumb/4/47/Lamasticot.PNG/300px-Lamasticot.PNG" class="img-circle" /></div>
                                <div class="col-lg-12 description_image"><h4>Je suis une magnifique phrase !</h4></div>
                            </div>
                        </div>
                    </div>
                 </div>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <%
                    newBabyQuick.Membre m = Session["membre"] as newBabyQuick.Membre;
                    if (m != null) { 
                        if (m != null && m.Type == 1) { %>
                        <div class="container">
                    <div class="row" style=" background-color: snow; position: relative; top: 50px; border: 2px solid grey; border-radius: 10px; padding: 1%;">
                        <h2 class="col-lg-12 page-header text-center">Les options disponibles :</h2>
                        <div class="row">
                            <div class="col-lg-offset-2 col-lg-4">
                                <a href="Search.aspx" class="btn btn-default btn-success btn-lg">Rechercher un babysitter</a>
                            </div>
                            <div class="col-lg-4 ">
                                <a href="#" class="btn btn-default btn-warning btn-lg">Voir les demandes récentes</a>
                            </div>
                        </div>
                        
                    </div>
                </div>

                    <% } else if (m.Type == 2){%>
                        <div class="container" style="position: relative; top: 15px;">
                            <div class="panel panel-default">
                                <div class="panel-heading"><h3>Panneau babysitter</h3></div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6"><a href="Demande.aspx" class="btn btn-default">Consulter ses demandes</a></div>
                                        <div class="col-lg-6"><a class="btn btn-default">Messages <span class="glyphicon glyphicon-envelope"></span></a></div>
                                    </div>
                                </div>
                            </div>
                            </div>
                <% } } else {
                       Session["errorSession"] = 1;
                       Response.Redirect("index.aspx");
                 } %>
                  
                
            </LoggedInTemplate>
        </asp:LoginView>
   
</asp:Content>

