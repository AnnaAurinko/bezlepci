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

    var cafeLayer = L.mapbox.featureLayer().addTo(map);
    var beerLayer = L.mapbox.featureLayer().addTo(map);
    var restLayer = L.mapbox.featureLayer().addTo(map);
    var shopLayer = L.mapbox.featureLayer().addTo(map);


////////////////////////////////////////
// Load JSON object

//load shop objects
$("#cafe").change(function(){
  if(this.checked) {
    $.ajax({
      dataType: 'text',
      url: 'api/places/?tags=["Kavarna"]',
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);
        for(var i = 0; i < geojson.length; i++) {
            geojson[i]["properties"]["marker-symbol"] = "cafe";
            geojson[i]["properties"]["marker-color"] = "#1b9e77";
        }
        return cafeLayer.setGeoJSON(geojson);
      }
    });
  }
  else {
    var geojson = null;
    return cafeLayer.setGeoJSON(geojson);
      }
});

//load beer objects
$("#beer").change(function(){
  if(this.checked) {
  $.ajax({
    dataType: 'text',
    url: 'api/places/?tags=["Pivo"]',
    success: function(data) {
      var geojson;
      geojson = $.parseJSON(data);
      for(var i = 0; i < geojson.length; i++) {
        geojson[i]["properties"]["marker-symbol"] = "beer";
        geojson[i]["properties"]["marker-color"] = "#d95f02";
      }
      /*console.log("TADYYYYYYYY")
      console.log(geojson)*/
      return beerLayer.setGeoJSON(geojson);
    }
  });
  }
  else {var geojson = null;
      return beerLayer.setGeoJSON(geojson);
    }
});


//load restaurant objects
$("#restaurant").change(function(){
  if(this.checked) {
    $.ajax({
      dataType: 'text',
      url: 'api/places/?tags=["Restaurace"]',
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);
        for(var i = 0; i < geojson.length; i++) {
          geojson[i]["properties"]["marker-symbol"] = "restaurant";
          geojson[i]["properties"]["marker-color"] = "#7570b3";
        }
        return restLayer.setGeoJSON(geojson);
      }
    });
  }
    else {
        var geojson = null;
        return restLayer.setGeoJSON(geojson);
    }
});

//load shops objects
$("#shop").change(function(){
  if(this.checked) {
    $.ajax({
      dataType: 'text',
      url: 'api/places/?tags=["Obchody"]',
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);
        for(var i = 0; i < geojson.length; i++) {
          geojson[i]["properties"]["marker-symbol"] = "shop";
          geojson[i]["properties"]["marker-color"] = "#e7298a";
        }
        return shopLayer.setGeoJSON(geojson);
      }
    });
  }
   else {
        var geojson = null;
        return shopLayer.setGeoJSON(geojson);
      }
});

//load all objects
$("#all").change(function(){
  if(this.checked) {
    $("#beer").prop("checked", true);
    $("#cafe").prop("checked", true);
    $("#restaurant").prop("checked", true);
    $("#shop").prop("checked", true);
  }
   else {
    $("#beer").prop("checked", false);
    $("#cafe").prop("checked", false);
    $("#restaurant").prop("checked", false);
    $("#shop").prop("checked", false);
  }
});


////////////////////////////////////////
// Info Window

markerLayer.on('layeradd', function(e) {
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
