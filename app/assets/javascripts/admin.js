////////////////////////////////////////
// Declaration of the attributes

var map;
var zoom = 14;
var markerLat = $("#map-canvas-admin").attr("latitude")
var markerLon = $("#map-canvas-admin").attr("longitude")
var name = $("#map-canvas-admin").attr("name")


////////////////////////////////////////
// Initialization of the map

map = L.mapbox.map('map-canvas-admin', 'examples.map-i86nkdio')
    .setView([markerLat, markerLon], zoom);


////////////////////////////////////////
// Add marker

L.mapbox.featureLayer({
    type: 'Feature',
    geometry: {
        type: 'Point',
        coordinates: [markerLon, markerLat ]
    },
    properties: {
        title: name,
        'marker-size': 'large',
        'marker-color': "#8D6FAB",
        'marker-symbol': 'star'
    }
}).addTo(map);