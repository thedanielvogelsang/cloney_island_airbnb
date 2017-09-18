class Airbnb

  attr_reader :name,
              :beds,
              :room_type,
              :price,
              :listing_image,
              :id

  def initialize(search)
    @id             = search[:listing][:id]
    @name           = search[:listing][:name]
    @beds           = search[:listing][:beds]
    @room_type      = search[:room_type_category]
    @price          = search[:pricing_quote][:rate][:amount]
    @listing_image = search[:listing][:picture_url]
  end

  def self.find(id)
    AirbnbService.find_listing(id)
  end
end
