class Api::ItemsController < ApiController
  before_action :check_auth
  before_filter :item_owned?, :on => [:create, :update, :destroy]

  def index
    items = Item.all

    render json: items, each_serializer: ItemSerializer
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item

    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item

    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      item = Item.find(params[:id])
      item.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end



private

  def item_params
    params.require(:item).permit(:name)
  end

  def item_owned?
    item.user == current_user
  end

end
