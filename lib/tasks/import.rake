namespace :import do

  desc "Amenities"
  task amenities: :environment do
    Amenities.create!(type: "Kitchen")
    Amenities.create!(type: "Essentials/Toiletries")
    Amenities.create!(type: "Air Conditioning")
    Amenities.create!(type: "Heating")
    Amenities.create!(type: "Washer/Dryer")
    Amenities.create!(type: "TV")
    Amenities.create!(type: "Private Entrance")
    Amenities.create!(type: "Living Room")
    Amenities.create!(type: "Wifi")
    Amenities.create!(type: "Hot Tub")
    Amenities.create!(type: "Fire Extinguisher")
  end

  puts "Amenities loaded and seeded"

  desc "Listings" #How do we assure that the host id we generate is a user that is actually a host?
  task listings: :environment do
    100.times do |n|
      Listings.create!(image_link: ["https://a0.muscache.com/im/pictures/21162888/5a0f1151_original.jpg?aki_policy=xx_large", "https://a0.muscache.com/im/pictures/6722906/b4bc6418_original.jpg?aki_policy=xx_large", "https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large", "https://a0.muscache.com/im/pictures/52149945/33130c63_original.jpg?aki_policy=xx_large"].rand,
      description: ["Suite of three beautifully furnished rooms set amongst the trees. Just minutes from downtown, this secluded property is an urban retreat like no other. The treehouse provides and intimate, simple and calming retreat for 2 people. The treehouse is the subject of innumerable articles, blogs and was recently featured on Treehouse Masters Ultimate Treehouses.", "Spend a unforgettable holiday in the enchanting surroundings of the town of Cisternino (reachable from the near airports of Bari and Brindisi).Trullo Edera offers a heaven of peace and tranquillity, set in an elevated position with a stunning view. It’s the perfect place if you like nature. You can stay under an olive tree reading a good book, you can have a walk in the small country streets or go to the nearest beaches.", "You can even easily visit any of the sights in Apulia such as the caves of Castellana, the trulli of Alberobello, the baroque cities of Lecce and Martina Franca, the excavations of Egnazia, the zoosafari of Fasano, Castel del Monte with Frederick’s castle, Grottaglie famous for its ceramics, Taranto, Brindisi and Lecce museums.", "Set on the sacred Ayung river valley, this all bamboo house is unique. First established in 2010, it is part of a master-planned community of luxurious bamboo villas with distinctive blonde roofs. Entering the house is a feast to the eyes and a showcase at how black and white bamboo can be combined in all shapes and pattern to create a stunning collection of luxurious floors, walls, ceiling, stairs and railings. Even the roof is an innovative arrangement of bamboo shingles."].rand,
      address_id: [*1..300].rand,
      user_id: [*1..500].rand,
      property_type: [1, 2, 3, 4, 5].rand,
      room_type: [1, 2, 3].rand,
      bed_type: [1, 2, 3, 4, 5, 6].rand,
      accomodates: [1, 2, 3, 4, 5, 6].rand,
      bathrooms: [1, 2, 3, 4, 5, 6].rand,
      name: "Home of #{Faker::Ancient.god}#{n}",
      bedrooms: [1, 2, 3, 4, 5, 6].rand,
      beds: [1, 2, 3, 4, 5, 6].rand,
      pet_type: [1, 2, 3, 4, 5].rand,
      price: [100, 200, 300, 400, 500, 600].rand,
      house_rules: ["No Smoking", "No Teenagers", "Hippies Use Back Door"].rand,
      cancellation_type: [1, 2, 3].rand)
      end
    end

    puts "Listings loaded and seeded"

    desc "Listing Amenities Join"
    task listing_amenities: :environment do
      300.times do
        ListingAmenities.create!(amenity_id: [*1..11].rand,
        listing_id: [*1..100].rand)
      end
    end

    puts "Listing Amenities loaded and seeded"

    desc "Addresses"
    task addresses: :environment do
      300.times do
        Address.create!(street_address: Faker::Address.street_address,
        street_address_2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        state: ["CO", "UT", "AK", "NM", "AZ", "CA", "OR", "WA", "TX", "TN", "IN", "IA"].rand,
        zip_code: Faker::Address.zip_code)
      end
    end

    puts "Users loaded and seeded"

    desc "Users"
    task users: :environment do
      1000.times do
        User.create!(birthday: Faker::Date.birthday(18, 97),
        address_id: [*1..300].rand,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone_number: Faker::PhoneNumber.area_code + '-' + Faker::PhoneNumber.exchange_code + '-' + Faker::PhoneNumber.subscriber_number,
        email:  Faker::Internet.unique.email,
        password: "password")
      end
    end

    puts "Users loaded and seeded"

    # desc "Cancellations"
    # task cancellations: :environment do
    #   10.times do
    #     Cancellation.create!(name: ["Flexible", "Moderate", "Strict"].rand,
    #     refund: ,
    #     description: )
    #   end
    # end

  #   puts "Cancellations loaded and seeded"
  # end

  desc "Roles"
  task roles: :environment do
    10.times do
      Role.create!(name: ["guest", "traveler", "host", "admin"].rand)
    end
  end

  puts "Roles loaded and seeded"

  desc "User_Roles"
  task user_roles: :environment do
    10.times do
      UserRole.create!(user_id: [*1..1000].rand,
      roles_id[*0..3].rand)
    end
  end

  puts "User_Roles loaded and seeded"

  desc "Trips" #I think we need to build in a way to insure that the host_id selected is actually a host??
  task trips: :environment do
    10.times do
      Trip.create!(user_id: [*1..500].rand,
      host_id: [*1..500].rand,
      trip_status: ["listed", "unlisted"].rand,
      start_date: Faker::Date.between(1.days.from_now, 3.days.from_now),
      end_date: Faker::Date.between(4.days.from_now, 6.days.from_now),
      num_guests: [1..4].rand)
    end
  end

  puts "Trips loaded and seeded"
end
