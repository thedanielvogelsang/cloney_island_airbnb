FactoryGirl.define do
  factory :user do
    # association :user_role, factory: :user_role
    # association :role, factory: :role

    first_name "Paul"
    last_name "Simon"
    phone_number "404-333-2222"
    email "paul@simon.com"
    password_digest "password"
    birthday "2017-07-11 20:04:56"
    profile_picture { File.new("#{Rails.root}/lib/assets/baby_penguin.jpg") }
  end
end
