class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    response_success(
      data: CategorySerializer.new(@categories).serializable_hash
    )
  end

end
