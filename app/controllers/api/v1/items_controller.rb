class Api::V1::ItemsController < Api::V1::ApiController

  def index
    render json:Item.all
  end

end