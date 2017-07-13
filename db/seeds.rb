user = User.create!(first_name: "Viking", last_name: "Raider", phone_number: "999-999-9999", email: "viking.raider@pillage.com", password: "password")

Role.create!([{name: "traveler"}, {name: "host"}, {name: "admin"}])
