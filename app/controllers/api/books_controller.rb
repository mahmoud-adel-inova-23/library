class Api::BooksController < ApiApplicationController
  def index
    @books = Book.includes(:translations, :author, :shelve, categories: :translations)
                 .filter_by_category(JSON.parse(params[:categories]))
                 .filter_by_name(params[:name])
                 .page(params[:page])

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
