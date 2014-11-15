<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="newBabyQuick.Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <div class="container" style="margin-bottom: 60px;">
        <div class="panel panel-default">
            <div class="panel-heading text-center">
                <h3>Etat de votre compte</h3>
            </div>

            <div class="panel-body">
                <div class="form-inline well">
                    <asp:Label runat="server" ID="NomPrenom"></asp:Label>
                </div>
                <div style="padding: 15px;">
                    <div class="row">
                        <div class="form-group">
                            <label for="<%= GsmMod.ClientID %>" class="col-md-3 col-sm-3">Numéro de téléphone : </label>
                            <asp:TextBox runat="server" ID="GsmMod" CssClass="form-control col-md-4 col-sm-4"></asp:TextBox>
                        </div>
                    </div>


                    <% newBabyQuick.Membre m = Session["membre"] as newBabyQuick.Membre;
                       if (m.Type == 1)
                       { %>
                    <div class="row">
                        <div class="form-group">
                            <label for="<%= NbEnfantProfil.ClientID %>" class="col-md-3 col-sm-3">Nombre d'enfants : </label>
                            <asp:TextBox runat="server" ID="NbEnfantProfil" CssClass="form-control col-md-6 col-sm-6"></asp:TextBox>
                        </div>
                    </div>
                    <% }
                       else
                       { %>
                    <div class="row">
                        <div class="form-group">
                            <label for="<%= dateDispo.ClientID %>" class="col-md-3 col-sm-3">Vous êtes disponible du : </label>
                            <asp:TextBox runat="server" ID="dateDispo" CssClass="form-control col-md-3 col-sm-3"></asp:TextBox>
                            <label for="<%= dateFinDispo.ClientID %>" class="col-md-2 col-sm-2">jusqu'au : </label>
                            <asp:TextBox runat="server" ID="dateFinDispo" CssClass="form-control col-md-3 col-sm-3"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="" class="col-lg-3">Statut du compte : </label>
                            <% var glyphiconEtat = ""; if (((newBabyQuick.Babysitter)m).Confirm) { glyphiconEtat = "ok"; } else { glyphiconEtat = "remove"; } %>
                            <span id="etat" class="glyphicon glyphicon-<%= glyphiconEtat %>"></span>
                        </div>
                    </div>
                    <% } %>

                    <div style="position: relative; top: 10px;">
                        <asp:TextBox runat="server" ID="lieux" CssClass="form-control"></asp:TextBox>
                        <div id="map-canvas" style="height: 350px"></div>
                    </div>
                </div>
            </div>
            <div class="panel-footer text-center">
                <asp:Button runat="server" ID="AcceptModification" Text="Editer le profil" CssClass="btn btn-success" OnClick="AcceptModification_Click" />
            </div>
        </div>

    </div>
    <script>
        $(function () {
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
                    new google.maps.LatLng(50.452908, 3.956469));
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
                            scaledSize: new google.maps.Size(50, 50)
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
