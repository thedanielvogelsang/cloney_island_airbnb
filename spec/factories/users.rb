FactoryGirl.define do
  factory :user do
    birthday "2017-07-11 20:04:56"
    first_name "Paul"
    last_name "Simon"
    phone_number "404-333-2222"
    email "paul@simon.com"
    password_digest "password"
  end
end
