$(document).ready(function() {

// var handler = Gmaps.build('Google');
// handler.buildMap({ internal: {id: 'multi_markers'}}, function(){
//   var markers = handler.addMarkers([
//     { lat: 43, lng: 3.5, infowindow: "I'm Foo"},
//     { lat: 45, lng: 4, infowindow: "I'm Foo"},
//     { lat: 47, lng: 3.5, infowindow: "I'm Foo"},
//     { lat: 49, lng: 4, infowindow: "I'm Foo"},
//     { lat: 51, lng: 3.5, infowindow: "I'm Foo"}
//   ]);
//   handler.bounds.extendWith(markers);
//   handler.fitMapToBounds();
// });

var handler = Gmaps.build('Google');
handler.buildMap({ internal: {id: 'geolocation'} }, function(){
  // be aware chrome >= 50 requires https for geolocation to work
  if(navigator.geolocation)
    navigator.geolocation.getCurrentPosition(displayOnMap);
});

function displayOnMap(position){

  var markers = handler.addMarkers([
    {lat: position.coords.latitude, lng: position.coords.longitude, infowindow: "You are here"},
    gon.hashh
  ]);
  debugger;
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds(markers);
};

  function initialize() {

  var input = document.getElementById('address');
  var autocomplete = new google.maps.places.Autocomplete(input);
  }

  google.maps.event.addDomListener(window, 'load', initialize);

    
});