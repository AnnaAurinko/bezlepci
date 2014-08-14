////////////////////////////////////////
// Declaration of the attributes

var map;
var zoom = 14;
var latitude = $("#map-canvas-admin").attr("latitude")
var longitude = $("#map-canvas-admin").attr("longitude")
var name = $("#map-canvas-admin").attr("name")
var specification = $("#map-canvas-admin").attr("tags")

var markersymbol

if (specification == "Pivo") markersymbol = "beer";
if (specification == "Obchod") markersymbol = "shop";
if (specification == "Kavarny") markersymbol = "cafe";
if (specification == "Restaurace") markersymbol = "restaurant";

var markercolor = "#FAAD1E"

if (specification == "Pivo") markercolor = "#d95f02";
if (specification == "Obchod") markercolor = "#e7298a";
if (specification == "Kavarny") markercolor = "#1b9e77";
if (specification == "Restaurace") markercolor = "#7570b3";

////////////////////////////////////////
// Initialization of the map

map = L.mapbox.map('map-canvas-admin', 'examples.map-i86nkdio')
    .setView([latitude, longitude], zoom);


////////////////////////////////////////
// Add marker

L.mapbox.featureLayer({
    type: 'Feature',
    geometry: {
        type: 'Point',
        coordinates: [longitude, latitude ]
    },
    properties: 
    {
        title: name,
        'marker-size': 'large',
        'marker-color': markercolor,
        'marker-symbol': markersymbol
    }
}).addTo(map);
   