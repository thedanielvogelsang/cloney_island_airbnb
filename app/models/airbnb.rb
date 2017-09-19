class Airbnb

  attr_reader :name,
              :beds,
              :room_type,
              :price,
              :listing_image

  def initialize(search)
    @name           = search[:listing][:name]
    @beds           = search[:listing][:beds]
    @room_type      = search[:room_type_category]
    @price          = search[:pricing_quote][:rate][:amount]
    @listing_image = search[:listing][:picture_url]
  end

  def self.find_properties(location)
    properties = AirbnbService.find_properties(location)
    properties.map do |property|
      new(property)
    end
  end
end