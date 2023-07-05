class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page])
    response_success(
      data: CategorySerializer.new(@categories,{
        meta: CategorySerializer.meta(@categories)
      }).serializable_hash
    )
  end

end
