class Category < ApplicationRecord
  paginates_per 10

  validates :name, presence: true
end