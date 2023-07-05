class Shelve < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :books

  def created_at_formated
    self.created_at.strftime("%B %d, %Y")
  end
end
