FactoryBot.define do
  factory :pokemon do
    number { Faker::Number.number(digits: 3) }
    name { Faker::Lorem.word }
    type_1 { Faker::Superhero.power }
    total { Faker::Number.number(digits: 3) }
    hp { Faker::Number.number(digits: 2) }
    attack { Faker::Number.number(digits: 2) }
    defense { Faker::Number.number(digits: 2) }
    sp_atk { Faker::Number.number(digits: 2) }
    sp_def { Faker::Number.number(digits: 2) }
    speed { Faker::Number.number(digits: 2) }
    generation { Faker::Number.between(from: 1, to: 5) }
    legendary { Faker::Boolean.boolean }
  end
end