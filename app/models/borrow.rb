# == Schema Information
#
# Table name: borrows
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  book_id     :bigint           not null
#  borrowed_at :datetime         not null
#  return_time :datetime         not null
#  returned_at :datetime
#  status      :integer          default("review")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Borrow < ApplicationRecord
  enum :status, {
    review: BorrowStatus::REVIEW,
    approved: BorrowStatus::APPROVED,
    rejected: BorrowStatus::REJECTED,
  }

  # Validations
  validates :user, presence: true
  validates :book, presence: true
  validates :borrowed_at, comparison: { greater_than_or_equal_to: Time.current }, presence: true
  validates :return_time, comparison: { greater_than: :borrowed_at }, presence: true
  validate :book_must_be_available, on: :create
  # validates :returned_at, comparison: { greater_than: :borrowed_at }, presence: false
  # validates :status, inclusion: { in: status.values }

  # Relations
  belongs_to :user
  belongs_to :book
  has_many :borrows

  def book_must_be_available
    if Borrow.where(returned_at: nil, book_id: book.id).where.not(status: BorrowStatus::REJECTED).any?
      errors.add(:book, "is Available try again later")
    end
  end

end
