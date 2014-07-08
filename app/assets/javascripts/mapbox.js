$(function() {
  $(".select2_wrapper select").select2({
    width: "resolve"
  });
});

////////////////////////////////////////
// Declaration of the attributes

var map;
var zoom = 14;
var mapCenterX = 50.0874275;
var mapCenterY = 14.4208297;

var geolocate = document.getElementById('geolocate');


////////////////////////////////////////
// Initialization of the map

map = L.mapbox.map('map-canvas', 'examples.map-i86nkdio')
    .setView([mapCenterX, mapCenterY], zoom);
    L.control.locate().addTo(map);


////////////////////////////////////////
// Load JSON object


$.ajax({
  dataType: 'text',
  url: 'api/places',
  success: function(data) {
    var geojson;
    geojson = $.parseJSON(data);
    return map.featureLayer.setGeoJSON(geojson);
  }
});


////////////////////////////////////////
// Info Window

map.featureLayer.on('layeradd', function(e) {
  var marker, popupContent, properties;
  marker = e.layer;
  properties = marker.feature.properties;
  popupContent =    '<div class="marker-title">'  + properties.name +  '</div>' + 
                    '<div class="marker-description">'  + properties.description +  '</div>' +
                    '<div class="marker-description">' + '<i>' + properties.address + '</i>' +  '</div>';
  return marker.bindPopup(popupContent, {
    closeButton: false,
    minWidth: 150,
    maxHeight: 280,
    autoPan: true,
    autoPanPaddingTopLeft: 20,
    autoPanPaddingBottomRight: 20,
    zoomAnimation: true
  });
});


////////////////////////////////////////
// Search function - NOT WORKING YET

var featureLayer = L.mapbox.featureLayer().addTo(map);

$('#search').keyup(search);

// This example requires jQuery or you can modify it to work with a different
// AJAX library. See the Markers from CSV example for full details of the
// restrictions of loading CSV files and the requirement of the csv2geojson
// library.
$.ajax({
    // you will need to replace this URL with the URL to your CSV file.
    url: '/mapbox.js/assets/data/airports.csv',
    success: csvLoaded
});

// Though these functions are below the places where they're used in this
// script, they'll still work due to JavaScript's function hoisting feature.
function csvLoaded(csv) {
    featureLayer.setGeoJSON(csv2geojson.csv2geojson(csv));
}

function search() {
    // get the value of the search input field
    var searchString = $('#search').val().toLowerCase();

    featureLayer.setFilter(showState);

    // here we're simply comparing the 'state' property of each marker
    // to the search string, seeing whether the former contains the latter.
    function showState(feature) {
        return feature.properties.state
            .toLowerCase()
            .indexOf(searchString) !== -1;
    }
}
