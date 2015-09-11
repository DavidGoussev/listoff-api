class Api::ItemsController < ApiController
  before_action :check_auth

  def create
    item = Item.new(item_params)
    if item.save

      render json: item
    else

      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      user = User.find(params[:id])
      user.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

private

  def item_params
    params.require(:item).permit(:name)
  end

end