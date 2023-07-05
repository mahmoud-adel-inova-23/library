class AuthorsController < ApplicationController
  def index
    @authors = Author.all.page(params[:page])

    response_success(
      data: AuthorSerializer.new(@authors).serializable_hash
    )
  end
end
