class GeojsonBuilder
  def self.build_listing(listing, geojson)
    geojson << {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [listing.longitude, listing.latitude]
      },
      properties: {
        name: listing.name,
        address: listing.address,
        :"marker-color" => "#FFFFFF",
        :"marker-symbol" => "circle",
        :"marker-size" => "medium",
      }
    }
  end
end
