class Book < ApplicationRecord
  paginates_per 10
  validates :name ,presence: true
  default_scope { order(id: :asc) }

  belongs_to :author
  belongs_to :shelve

  def is_available
     self.borrowed_at.nil?
  end
end
