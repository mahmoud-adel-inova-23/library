FactoryBot.define do
  factory :book_category, class: 'BookCategory' do
    association :book, factory: :book
    association :category, factory: :category
  end
end
