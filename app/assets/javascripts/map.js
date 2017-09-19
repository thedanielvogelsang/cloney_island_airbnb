$(document).on("ready", function() {
  L.mapbox.accessToken = gon.mapbox_api_key;
  var map = L.mapbox.map('map', 'mapbox.run-bike-hike', { zoomControl: false }).setView([39.739, -104.990], 12);
  var myLayer = L.mapbox.featureLayer().addTo(map);

  myLayer.on("layeradd", function(e){
    var marker = e.layer;
    var properties = marker.feature.properties;
    var popupContent = '<div class="marker-popup">' + '<h3>' + properties.name + '</h3>' +
    '<h4>' + properties.address + '</h4>' + '</div>';
    return marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
  });

      $.ajax({
        dataType: "text",
        url: "/listings.json",
        success:function(listings) {
          var geojson = $.parseJSON(listings);
          return myLayer.setGeoJSON({
            type: "FeatureCollection",
            features: geojson
          });

        },
        error:function() {
          alert("Could not load the listings");
        }
      });
});
