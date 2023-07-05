class ShelveSerializer
  include JSONAPI::Serializer
  attributes :name
  attribute :created_at do |record|
    record.created_at_formated
  end

  class << self
    def meta(shelves)
      {
        current_page: shelves.current_page,
        next_page: shelves.next_page,
        prev_page: shelves.prev_page,
        total_pages: shelves.total_pages,
        total_count: shelves.total_count
      }
    end
  end
end
