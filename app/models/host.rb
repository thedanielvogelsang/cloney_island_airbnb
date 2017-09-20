class AirbnbHost

  def create_host(user_hash, id)
    host = User.new(first_name: user_hash[:first_name],)
    id = AirbnbService.find_listing(id).id
    host.listings << Listing.find(airbnb_id: id)
  end
end
