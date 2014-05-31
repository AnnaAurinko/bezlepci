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

	//search for adress tool
	/*map.addControl(L.mapbox.geocoderControl('examples.map-i875kd35', {
        keepOpen: true
    }));*/


////////////////////////////////////////
// Adding point geojson layer

var myLayer = L.mapbox.featureLayer().addTo(map);

var geojson = {
    type: 'FeatureCollection',
    features: [{
        type: 'Feature',
        properties: {
            title: 'Obchody',
            'marker-color': '#f86767',
            'marker-size': 'large',
            'marker-symbol': 'shop'
        },
        geometry: {
            type: 'Point',
            coordinates: [14.4167725, 50.0807878]
        }
    },
    {
        type: 'Feature',
        properties: {
            title: 'Restaurace',
            'marker-color': '#b76ca7',
            'marker-size': 'large',
            'marker-symbol': 'fast-food'
        },
        geometry: {
            type: 'Point',
            coordinates: [14.4276978, 50.0929300]
        }
    },
    {
        type: 'Feature',
        properties: {
            title: 'Kavárny',
            'marker-color': '#7ec9b1',
            'marker-size': 'large',
            'marker-symbol': 'cafe'
        },
        geometry: {
            type: 'Point',
            coordinates: [14.4038744, 50.0884569]
        }
    },
    {
        type: 'Feature',
        properties: {
            title: 'Pivo',
            'marker-color': '#fa0',
            'marker-size': 'large',
            'marker-symbol': 'bar'
        },
        geometry: {
            type: 'Point',
            coordinates: [14.4161803, 50.0789139]
        }
    }]
};


////////////////////////////////////////
// Load JSON object

// get JSON object
// on success, parse it and 
// hand it over to MapBox for mapping 

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
  popupContent =    '<div>' + 
                        '<h3>' + properties.name + '</h3>' + 
                        '<p>' +  properties.address + '</p>' + 
                    '</div>';
  return marker.bindPopup(popupContent, {
    closeButton: false,
    minWidth: 150,
  });
});


////////////////////////////////////////
// Mouseover popup

myLayer.setGeoJSON(geojson);
myLayer.on('mouseover', function(e) {
    e.layer.openPopup();
});
myLayer.on('mouseout', function(e) {
    e.layer.closePopup();
});



////////////////////////////////////////
// Geolocation of my location (moje poloha)

// This uses the HTML5 geolocation API, which is available on
// most mobile browsers and modern browsers, but not in Internet Explorer
//
// See this chart of compatibility for details:
// http://caniuse.com/#feat=geolocation
if (!navigator.geolocation) {
    geolocate.innerHTML = 'Geolocation is not available';
} else {
    geolocate.onclick = function (e) {
        e.preventDefault();
        e.stopPropagation();
        map.locate();
    };
}

// Once we've got a position, zoom and center the map
// on it, and add a single marker.
map.on('locationfound', function(e) {
    map.fitBounds(e.bounds);

    myLayer.setGeoJSON({
        type: 'Feature',
        geometry: {
            type: 'Point',
            coordinates: [e.latlng.lng, e.latlng.lat]
        },
        properties: {
            'title': 'Tady jsem :)',
            'marker-color': '#ff8888',
            'marker-symbol': 'star'
        }
    });

    // And hide the geolocation button
    geolocate.parentNode.removeChild(geolocate);
});

// If the user chooses not to allow their location
// to be shared, display an error message.
map.on('locationerror', function() {
    geolocate.innerHTML = 'něco je špatně :( nemohu určit tvojí polohu';
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
