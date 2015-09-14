class ListsController < ApplicationController


  def new
    @list = list.new
  end

  def create
    @user = User.find(params[:user_id])
    @list = current_user.lists.build(list_params)
    @lists = @user.lists
    @new_list = List.new

    if @list.save
      flash.now[:notice] = "to-do list created!"
      redirect_to @user
    else
      flash.now[:error] = "error saving list, try again!"
      render 'users/show'
    end

  end

  def destroy
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:id])

    if @list.destroy
      flash.now[:notice] = "list was removed"
      redirect_to [@user]
    else
      flash.now[:error] = "list was not removed"
      render 'users/show'
    end


  end

  private

  def list_params
    params.require(:list).permit(:title, :permissions)
  end

end
