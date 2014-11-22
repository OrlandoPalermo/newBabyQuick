<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="newBabyQuick.Inscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
     <% 
        try
        {
            newBabyQuick.Membre m = (newBabyQuick.Membre)Session["membre"];

            if (m != null)
            {
                Response.Redirect("index.aspx");
            }
        }
        catch (Exception E)
        {
            
        }
       %>
    <style>
        #map-canvas {
            height: 250px;
            margin: 0px;
            padding: 0px;
        }
    </style>
   
    <script src="Scripts/jqueryUI/jquery-ui.min.js"></script>
    <asp:Label runat="server" Text="" ID="test"></asp:Label>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>Inscription</h2>
            </div>
            <div class="panel-body" style="padding: 30px;">
                <div class="row">
                    <div class="form-group">
                        <label for="<%= nom.ClientID %>" class="col-lg-2">Nom</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="nom" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="nom" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>

                        </div>
                        <label for="<%= prenom.ClientID %>" class="col-lg-2">Prenom</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="prenom" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="prenom" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <label for="<%= password.ClientID %>" class="col-lg-2">Mot de passe</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" CssClass="form-control" ID="password"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="password" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="<%= gsm.ClientID %>" class="col-lg-2">Gsm</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="gsm" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="gsm" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="<%= email.ClientID %>" class="col-lg-2">Email</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="email" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="email" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <asp:TextBox runat="server" ID="lieux" CssClass="form-control col-lg-12"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="lieux" CssClass="text-danger" ErrorMessage="Le champ est obligatoire"></asp:RequiredFieldValidator>
                    <div id="map-canvas" class="col-lg-12"></div>

                </div>
                <div class="row">
                    <div class="form-group">
                        <label class="col-lg-3">Type : </label>
                        <div class="btn-group" data-toggle="buttons">
                            <label for="<%= parents.ClientID %>" id="labelP" class="btn btn-default">
                                <asp:RadioButton runat="server" GroupName="typeMembre" ID="parents" />Parents
                            </label>
                            <label for="<%= babysitter.ClientID %>" id="labelB" class="btn btn-default">
                                <asp:RadioButton runat="server" GroupName="typeMembre" ID="babysitter" />Babysitter
                            </label>
                        </div>
                    </div>

                </div>
                <div id="boxParents" style="display: none;">
                    <div class="row" id="nbEnfantsGroup">
                        <div class="form-group">
                            <label for="<%= nbEnfants.ClientID %>" class="col-lg-2">Nombre d'enfants : </label>
                            <div class="col-lg-4">
                                <asp:TextBox runat="server" CssClass="form-control" ID="nbEnfants" />
                                <asp:CompareValidator runat="server" ControlToValidate="nbEnfants" ErrorMessage="Merci de renseigner uniquement des chiffres !" CssClass="text-danger" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                            </div>
                        </div>
                    </div>

                </div>
                <div id="boxBabysitter" style="display: none;">
                    <div class="form-group">
                        <label for="<%= dateDispo.ClientID %>">Vous êtes disponible du : </label>
                        <asp:TextBox runat="server" ID="dateDispo" CssClass="form-control"></asp:TextBox>
                        <label for="<%= dateFinDispo.ClientID %>">jusqu'au : </label>
                        <asp:TextBox runat="server" ID="dateFinDispo" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row" style="text-align: center;">
                    <asp:Button runat="server" ID="SendInscription" CssClass="btn btn-success" Text="S'inscrire" Enabled="false" />
                </div>
            </div>
            <asp:Label runat="server" ID="testAff"></asp:Label>
        </div>
    </div>



    <script>
        $(function () {
            $("#labelP").click(function () {
                $("#boxParents").fadeIn();
                $("#boxBabysitter").fadeOut();
                $("#<%= SendInscription.ClientID %>").removeAttr("disabled");
            });

            $("#labelB").click(function () {
                $("#boxParents").fadeOut();
                $("#boxBabysitter").fadeIn();
                $("#<%= SendInscription.ClientID %>").removeAttr("disabled");
            });

            $("#<%= dateDispo.ClientID %>").datepicker({
                dateFormat: "dd-mm-yy",
                onClose: function (selectedDate) {
                    $("#<%= dateFinDispo.ClientID %>").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#<%= dateFinDispo.ClientID %>").datepicker({
                dateFormat: "dd-mm-yy",
                onClose: function (selectedDate) {
                    $("#<%= dateDispo.ClientID %>").datepicker("option", "maxDate", selectedDate);
                }
            });

            function initialize() {

                var markers = [];
                var map = new google.maps.Map(document.getElementById('map-canvas'), {
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });

                var defaultBounds = new google.maps.LatLngBounds(
                    new google.maps.LatLng(-33.8902, 151.1759),
                    new google.maps.LatLng(-33.8474, 151.2631));
                map.fitBounds(defaultBounds);

                // Create the search box and link it to the UI element.
                var input = /** @type {HTMLInputElement} */(
                    document.getElementById('<%= lieux.ClientID %>'));
                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

                var searchBox = new google.maps.places.SearchBox(
                  /** @type {HTMLInputElement} */(input));

                // [START region_getplaces]
                // Listen for the event fired when the user selects an item from the
                // pick list. Retrieve the matching places for that item.
                google.maps.event.addListener(searchBox, 'places_changed', function () {
                    var places = searchBox.getPlaces();

                    if (places.length == 0) {
                        return;
                    }
                    for (var i = 0, marker; marker = markers[i]; i++) {
                        marker.setMap(null);
                    }

                    // For each place, get the icon, place name, and location.
                    markers = [];
                    var bounds = new google.maps.LatLngBounds();
                    for (var i = 0, place; place = places[i]; i++) {
                        var image = {
                            url: place.icon,
                            size: new google.maps.Size(71, 71),
                            origin: new google.maps.Point(0, 0),
                            anchor: new google.maps.Point(17, 34),
                            scaledSize: new google.maps.Size(25, 25)
                        };

                        // Create a marker for each place.
                        var marker = new google.maps.Marker({
                            map: map,
                            icon: image,
                            title: place.name,
                            position: place.geometry.location
                        });

                        markers.push(marker);

                        bounds.extend(place.geometry.location);
                    }

                    map.fitBounds(bounds);
                });
                // [END region_getplaces]

                // Bias the SearchBox results towards places that are within the bounds of the
                // current map's viewport.
                google.maps.event.addListener(map, 'bounds_changed', function () {
                    var bounds = map.getBounds();
                    searchBox.setBounds(bounds);
                });
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        });
    </script>
</asp:Content>
