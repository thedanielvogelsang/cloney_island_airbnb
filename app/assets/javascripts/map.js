$(document).on("ready", function() {
  L.mapbox.accessToken = gon.mapbox_api_key;
  var map = L.mapbox.map('map', 'mapbox.run-bike-hike', { zoomControl: false })
  .setView([39.739, -104.990], 12);

  map.featureLayer.on("ready", function(e) {
    getListings(map);
  });
});

function getListings(map) {
  var $loading_wheel = $("#spinning-wheel")
  $loading_wheel.show();
  $.ajax({
    dataType: 'text',
    url: '/listings.json',
    success:function(listings) {
      $loading_wheel.hide();
      console.log(listings);
      var geojson = $.parseJSON(listings);
      map.featureLayer.setGeoJSON({
        type: "FeatureCollection",
        features: geojson
      });
      addListingPopups(map);
    },
    error:function() {
      $loading_wheel.hide();
      alert("Could not load the listings");
    }
  });
}

function addListingPopups(map) {
  map.featureLayer.on("layeradd", function(e){
    var marker = e.layer;
    var properties = marker.feature.properties;
    var popupContent = '<div class="marker-popup">' + '<h3>' + properties.name + '</h3>' +
                       '<h4>' + properties.address + '</h4>' + '</div>';
    marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
  });
}
