class ItemsController < ApplicationController


  def new
    @item = Item.new
  end

  def index
    @item = Item.all
  end

  def create
    # @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
    @item = current_user.items.build(item_params)
    @item.list = @list
    @items = @list.items

    @new_item = Item.new

    if @item.save
      flash.now[:notice] = "to-do item created!"
      #redirect_to @user
    else
      flash.now[:error] = "error saving item, try again!"
      #render 'users/show'
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])

    if @item.destroy
      flash.now[:notice] = "item was removed"
      #redirect_to [@user]
    else
      flash.now[:error] = "item was not removed"
      #redirect_to [@user]
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
