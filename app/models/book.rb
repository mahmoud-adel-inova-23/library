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

  validate do |book|
    ShelveBookValidator.new(book).validate
  end

  validate do |book|
    CategoryBookValidator.new(book).validate
  end

  translates :name, type: :string, association_name: :translations, ransack: true
  paginates_per 10
  # validates :name ,presence: true
  default_scope { order(id: :asc) }
  # default_scope -> { includes(:translations) }

  scope :filter_by_name, -> (name) { ransack(name_cont: name).result if name.present? }
  scope :filter_by_category, -> (categories) { joins(:categories).where(categories: { id: categories }) if categories.present? }

  belongs_to :author
  belongs_to :shelve

  has_many :book_categories
  has_many :categories, :through => :book_categories

  def is_available
    self.borrowed_at.nil?
  end

  def created_at_formated
    self.created_at.strftime("%B %d, %Y")
  end
end
