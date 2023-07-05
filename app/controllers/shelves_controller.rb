class ShelvesController < ApplicationController

  def index
    @shelves = Shelve.all.page(params[:page])

    response_success(
      data: ShelveSerializer.new(@shelves,{
        meta: ShelveSerializer.meta(@shelves)
      }).serializable_hash
    )
  end

end
