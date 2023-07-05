FactoryBot.define do
  factory :shelve do
    name { Faker::Name.name }
    max_amount { Faker::Number.between(from: 3 , to: 20).to_i }
  end
end
