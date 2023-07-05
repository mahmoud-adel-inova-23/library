class BooksController < ApplicationController
  def index
    @books = Book.includes(:author,:shelve).page(params[:page])

    response_success(
      data: BookSerializer.new(@books, {
        meta: BookSerializer.meta(@books),
        params: {
          include_relations: {
            author: true,
            shelve: true
          }
        }
      }).serializable_hash
    )
  end
end
