class Category < ApplicationRecord
  paginates_per 10

  has_many :book_categories
  has_many :books , :through => :book_categories

  validates :name, presence: true
end
