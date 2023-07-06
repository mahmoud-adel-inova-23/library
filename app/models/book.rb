# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  name        :string
#  author_id   :bigint           not null
#  shelve_id   :bigint           not null
#  borrowed_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
  extend Mobility

  translates :name, type: :string
  paginates_per 10
  # validates :name ,presence: true
  default_scope { order(id: :asc) }

  belongs_to :author
  belongs_to :shelve

  has_many :book_categories
  has_many :categories , :through => :book_categories

  def is_available
     self.borrowed_at.nil?
  end
end
