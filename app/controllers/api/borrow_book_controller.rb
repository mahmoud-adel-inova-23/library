class Api::BorrowBookController < ApiApplicationController
  def store
    @current_user.borrows.create!(
      params.require(:borrow).permit(:book_id, :borrowed_at, :return_time)
    )

    response_success(data: [])
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
