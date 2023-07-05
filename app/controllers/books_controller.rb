class BooksController < ApplicationController
  def index
    @books = Book.includes(:author, :shelve, :categories).page(params[:page])

    response_success(
      data: BookSerializer.new(@books, {
        meta: BookSerializer.meta(@books),
        params: {
          include_relations: {
            author: true,
            shelve: true,
            categories: true
          }
        }
      }).serializable_hash
    )
  end
end
