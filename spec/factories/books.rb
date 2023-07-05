FactoryBot.define do
  factory :book do
    name { Faker::Name.name }
    author_id { Author.order("RANDOM()").limit(1).first.id }
    shelve_id { Shelve.order("RANDOM()").limit(1).first.id }
  end
end
