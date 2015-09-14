class Api::UsersController < ApiController
  before_action :check_auth

  def index
    return permission_denied_error unless conditions_met

    users = User.all

    render json: users, each_serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
    user.skip_confirmation!

    if user.save!
      render json: user

    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
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

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

  def conditions_met
    true # We're not calling this an InsecureUserSerializer for nothing
  end
end
