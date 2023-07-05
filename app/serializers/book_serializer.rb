class BookSerializer
  include JSONAPI::Serializer
  attributes :Book
  attribute :avaliable do

  end

  attribute :author, if: Proc.new { |book, params|
    params[:include_relations][:author] || false
  } do
    AuthorSerializer.new(book.author).serializable_hash
  end

end
