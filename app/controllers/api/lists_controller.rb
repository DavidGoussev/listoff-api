class Api::ListsController < ApiController
  before_action :check_auth
  before_filter :list_owned?, :on => [:create, :update, :destroy]

  def index
    lists = List.all

    render json: lists, each_serializer: ListSerializer

  end

  def create
    list = List.new(list_params)
    if list.save

      render json: list

    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)

      render json: list

    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.find(params[:id])
      list.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end



  private

  def list_params
    params.require(:list).permit(:title, :permissions)
  end

  def list_params_validated
    params.require(:list).permit(:title, permissions: ["private", "viewable", "open"])
  end

  def list_owned?
    list.user == current_user
  end

end
