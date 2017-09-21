$(document).on("ready", function() {
  L.mapbox.accessToken = 'pk.eyJ1IjoibGFsb25kZWoiLCJhIjoiY2o3c2I4MW43MnZ5NjMzbzZjNXpuZXE2ZyJ9.sspxGF6kmKlobwI859-InQ'
  var map = L.mapbox.map('map', 'mapbox.run-bike-hike', { zoomControl: false }).setView([39.739, -104.990], 12);
  var myLayer = L.mapbox.featureLayer().addTo(map);

  myLayer.on("layeradd", function(e){
    var marker = e.layer;
    var properties = marker.feature.properties;
    var popupContent = '<div class="marker-popup">' + '<h3>' + properties.name + '</h3>' +
      '<h4>' + properties.address + '</h4>' + '</div>';
    map.fitBounds(myLayer.getBounds());
    return marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
  });
  $(document).on('click', '.search-submit', function(b){
    b.preventDefault();
    var address = document.getElementsByClassName('search-address')[0].value
    $.ajax({
      dataType: "text",
      url: "/listings.json",
      data: {search_address: address},
      success:function(data) {
        var geojson = $.parseJSON(data);
        myLayer.setGeoJSON({
          type: "FeatureCollection",
          features: geojson
        });
      },
      error:function(error) {
        alert("Could not load the listings");
      }
    });
  });
});
