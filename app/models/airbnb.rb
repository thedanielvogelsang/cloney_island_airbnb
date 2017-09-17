class Airbnb

  attr_reader :name,
              :beds,
              :room_type,
              :price

  def initialize(search)
    @name      = search[:listing][:name]
    @beds      = search[:listing][:beds]
    @room_type = search[:room_type_category]
    @price     = search[:pricing_quote][:rate][:amount]
  end
end