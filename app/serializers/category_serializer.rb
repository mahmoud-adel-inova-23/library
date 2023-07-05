class CategorySerializer
  include JSONAPI::Serializer
  attributes :name

  class << self
    def meta(categories)
      {
        current_page: categories.current_page,
        next_page: categories.next_page,
        prev_page: categories.prev_page,
        total_pages: categories.total_pages,
        total_count: categories.total_count
      }
    end
  end

end
