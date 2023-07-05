class AuthorSerializer
  include JSONAPI::Serializer
  attributes :name

  class << self
    def meta(authors)
      {
        current_page: authors.current_page,
        next_page: authors.next_page,
        prev_page: authors.prev_page,
        total_pages: authors.total_pages,
        total_count: authors.total_count
      }
    end
  end
end
