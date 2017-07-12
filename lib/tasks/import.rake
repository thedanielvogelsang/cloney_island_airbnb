namespace :import do

  desc "Ammenities"
  task ammenities: :environment do
    Ammenities.create!(type: "Kitchen")
    Ammenities.create!(type: "Essentials/Toiletries")
    Ammenities.create!(type: "Air Conditioning")
    Ammenities.create!(type: "Heating")
    Ammenities.create!(type: "Washer/Dryer")
    Ammenities.create!(type: "TV")
    Ammenities.create!(type: "Private Entrance")
    Ammenities.create!(type: "Living Room")
    Ammenities.create!(type: "Wifi")
    Ammenities.create!(type: "Hot Tub")
    Ammenities.create!(type: "Fire Extinguisher")
  end

  puts "Ammenities loaded and seeded"

  desc "Listings"
  task listings: :environment do
    100.times do |n|
      Listings.create!(image_link: ["https://a0.muscache.com/im/pictures/21162888/5a0f1151_original.jpg?aki_policy=xx_large", "https://a0.muscache.com/im/pictures/6722906/b4bc6418_original.jpg?aki_policy=xx_large", "https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large", "https://a0.muscache.com/im/pictures/52149945/33130c63_original.jpg?aki_policy=xx_large"].rand,
      description: ["Suite of three beautifully furnished rooms set amongst the trees. Just minutes from downtown, this secluded property is an urban retreat like no other. The treehouse provides and intimate, simple and calming retreat for 2 people. The treehouse is the subject of innumerable articles, blogs and was recently featured on Treehouse Masters Ultimate Treehouses.", "Spend a unforgettable holiday in the enchanting surroundings of the town of Cisternino (reachable from the near airports of Bari and Brindisi).Trullo Edera offers a heaven of peace and tranquillity, set in an elevated position with a stunning view. It’s the perfect place if you like nature. You can stay under an olive tree reading a good book, you can have a walk in the small country streets or go to the nearest beaches.", "You can even easily visit any of the sights in Apulia such as the caves of Castellana, the trulli of Alberobello, the baroque cities of Lecce and Martina Franca, the excavations of Egnazia, the zoosafari of Fasano, Castel del Monte with Frederick’s castle, Grottaglie famous for its ceramics, Taranto, Brindisi and Lecce museums.", "Set on the sacred Ayung river valley, this all bamboo house is unique. First established in 2010, it is part of a master-planned community of luxurious bamboo villas with distinctive blonde roofs. Entering the house is a feast to the eyes and a showcase at how black and white bamboo can be combined in all shapes and pattern to create a stunning collection of luxurious floors, walls, ceiling, stairs and railings. Even the roof is an innovative arrangement of bamboo shingles."].rand,
      address_id: [1, 2, 3, 4, 5, 6].rand,
      user_id: [1, 2, 3, 4, 5, 6].rand,
      property_type: [1, 2, 3, 4, 5].rand,
      room_type: [1, 2, 3].rand,
      bed_type: [1, 2, 3, 4, 5, 6].rand,
      accomodates: [1, 2, 3, 4, 5, 6].rand,
      bathrooms: [1, 2, 3, 4, 5, 6].rand,
      name: "Ben's Bungalow #{n}",
      bedrooms: [1, 2, 3, 4, 5, 6].rand,
      beds: [1, 2, 3, 4, 5, 6].rand,
      pet_type: [1, 2, 3, 4, 5].rand,
      price: [100, 200, 300, 400, 500, 600].rand,
      house_rules: ["No Smoking", "No Teenagers", "Hippies Use Back Door",
        cancellation_id: [1, 2, 3].rand)
      end
    end

    puts "Listings loaded and seeded"

    desc "Listing Ammenities Join"
    task listing_ammenities: :environment do
      300.times do
        ListingAmmenities.create!(ammenity_id: [*1..11].rand,
        listing_id: [*1..101].rand)
      end
    end

    puts "Listing Ammenities loaded and seeded"

    desc "Addresses"
    task addresses: :environment do
      300.times do
        Address.create!(street_address: ["45 Horizon St", "622 Lincoln St", "987 Turkey Creek", "1242 Market St", "9861 4th Ave", "96543 Hwy 78"].rand,
        street_address_2: ["", "", "Apt 3", "Unit 2"].rand,
        city: ["Denver", "Santa Fe", "New York", "Boulder", "Telluride", "Pagosa Springs", "Durango"].rand,
        state: ["CO", "UT", "AK", "NM", "AZ", "CA", "OR", "WA"].rand,
        zip_code: ["80132", "90423", "83729", "74093", "82032", "93023"].rand)
      end
    end

    puts "Users loaded and seeded"

    desc "Users"
    task users: :environment do
      1000.times do
        User.create!(birthday:,
        address_id: [*1..10].rand,
        first_name: ["Bao", "Padraic", "Adam", "Will", "Ben"].rand,
        last_name: ["Gunther", "Thomas", "Ross"].rand,
        phone_number: ["303-484-9383", "399-483-9323", "970-484-9383", "720-484-9383", "309-484-9353", "303-344-1383"].rand,
        email: ["email@email"],
        password_digest: )
      end
    end

    puts "Users loaded and seeded"

    desc "Cancellations"
    task cancellations: :environment do
      10.times do
        Cancellation.create!(name: [""],
        refund: ,
        description: )
      end
    end

    puts "Cancellations loaded and seeded"
  end

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
      UserRole.create!(user_id: [*1..50].rand,
      roles_id[*0..3].rand)
    end
  end

  puts "User_Roles loaded and seeded"

  desc "Trips"
  task trips: :environment do
    10.times do
      Trip.create!(id_users:,
      id_hosts:,
      trip_status: ["listed", "unlisted"].rand,
      start_date:,
      end_date:,
      num_guests:)
    end
  end

  puts "Trips loaded and seeded"
end

  For trips listed and unlisted
