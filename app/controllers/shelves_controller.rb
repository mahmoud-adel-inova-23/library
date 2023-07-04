class ShelvesController < ApplicationController

  def index
    @shelves = Shelve.all

    response_success(
      data: ShelveSerializer.new(@shelves).serializable_hash
    )
  end

end
