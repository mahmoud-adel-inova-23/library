class Author < ApplicationRecord
  paginates_per 10
  validates :name, presence: true, uniqueness: true
  has_many :books
end
