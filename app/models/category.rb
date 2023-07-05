class Category < ApplicationRecord
  paginates_per 10

  extend Mobility
  translates :name, type: :string

  # validates :name, presence: true
end
