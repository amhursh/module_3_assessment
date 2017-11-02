class Api::V1::ItemsController < Api::V1::ApiController
  include ActionController::API

  def index
    render json: Item.all, except: [:created_at, :updated_at]
  end

  def show 
    item = Item.find(params[:id])
    render json: item, except: [:created_at, :updated_at]
  end

  def destroy
    Item.delete(params[:id])
    head :no_content
  end

  def create
    item = Item.create(item_params)
    render json: item, except: [:created_at, :updated_at]
  end

  private

    def item_params
      params.require(:params).require(:item).permit(:name, :description, :image_url)
    end

end