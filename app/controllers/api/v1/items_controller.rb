class Api::V1::ItemsController < Api::V1::ApiController

  def index
    render json: Item.all, except: [:created_at, :updated_at]
  end

  def show 
    item = Item.find(params[:id])
    render json: item, except: [:created_at, :updated_at]
  end

end