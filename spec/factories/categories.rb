FactoryBot.define do
  factory :category do
    name_en { Faker::Name.name }
    name_ar { Faker::Name.name }
  end
end
