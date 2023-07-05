class BookSerializer
  include JSONAPI::Serializer
  attributes :name
  attribute :avaliable do |record|
    record.is_available
  end

  attribute :author, if: Proc.new { |book, params|
    params[:include_relations]&.dig(:author) || false
  } do |book|
    AuthorSerializer.new(book.author,{
      params: {
        include_relations: {
          books: false
        }
      }
    }).serializable_hash
  end

  attribute :shelve, if: Proc.new { |book, params|
    params[:include_relations]&.dig(:shelve) || false
  } do |book|
    ShelveSerializer.new(book.shelve,{
      params: {
        include_relations: {
          books: false
        }
      }
    }).serializable_hash
  end

  class << self
    def meta(books)
      {
        current_page: books.current_page,
        next_page: books.next_page,
        prev_page: books.prev_page,
        total_pages: books.total_pages,
        total_count: books.total_count
      }
    end
  end
end
