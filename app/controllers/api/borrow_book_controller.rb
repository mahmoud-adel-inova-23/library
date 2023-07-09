class Api::BorrowBookController < ApiApplicationController
  before_action :set_book, only: :return_book
  def store
    @current_user.borrows.create!(
      params.require(:borrow).permit(:book_id, :borrowed_at, :return_time)
    )

    response_success
  end

  def return_book
    @book.mark_as_returned(@current_user)

    response_success
  end

  private

  # @return[Book]
  def set_book
    @book = Book.find(params[:id])
  end
end
