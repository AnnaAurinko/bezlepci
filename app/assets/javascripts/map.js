////////////////////////////////////////
// Declaration of the attributes

var map;
var mapCenter = new google.maps.LatLng(50.0807878, 14.4167725);

var markerPosition = new google.maps.LatLng(50.0789139, 14.4161803);


////////////////////////////////////////
// Initialization of the map

function initialize() { 

  // map options
  var mapOptions = {
    center: mapCenter, 
    zoom: 13
  };

  //map object
  map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
      

  //adding markers
  var marker = new google.maps.Marker({
      position: markerPosition,
      map: map,
      title: 'I am the marker'
    });
}
  
  //loading the map
  google.maps.event.addDomListener(window, 'load', initialize);