class GeojsonBuilder
  def self.build_listing(listing)
     {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [listing.longitude, listing.latitude]
      },
      properties: {
        name: listing.name,
        address: listing.address,
        :"marker-color" => "#ff5a5f",
        :"marker-symbol" => "circle",
        :"marker-size" => "medium",
      }
    }
  end
end
