FactoryGirl.define do
  factory :experience do
    title Faker::Zelda.character
    duration  "#{Faker::Number.between(1, 10)} hours"
    tagline Faker::Zelda.game
    what Faker::ElderScrolls.creature
    where Faker::ElderScrolls.region
    provisions Faker::Food.dish
    notes Faker::Simpsons.quote
    price Faker::Number.between(10, 300)
    user
  end
end
