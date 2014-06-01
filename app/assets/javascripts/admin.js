////////////////////////////////////////
// Declaration of the attributes

var map;
var zoom = 14;
var latitude = $("#map-canvas-admin").attr("latitude")
var longitude = $("#map-canvas-admin").attr("longitude")
var name = $("#map-canvas-admin").attr("name")
var specification = $("#map-canvas-admin").attr("specification")

var markersymbol

if (specification == "Pivo") markersymbol = "beer";
if (specification == "Obchod") markersymbol = "shop";
if (specification == "Kavárna") markersymbol = "cafe";
if (specification == "Restaurace") markersymbol = "restaurant";

var markercolor = "#FAAD1E"

if (specification == "Pivo") markercolor = "#2F7582";
if (specification == "Obchod") markercolor = "#C86F73";
if (specification == "Kavárna") markercolor = "#725421";
if (specification == "Restaurace") markercolor = "#717135";

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