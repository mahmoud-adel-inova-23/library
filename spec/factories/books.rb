FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    association :author, factory: :author
    association :shelve, factory: :shelve
  end
end
