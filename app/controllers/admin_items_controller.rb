class AdminItemsController < ApplicationController
  before_action :auth_user
  before_action :set_items, only: %i[update show edit destroy]
  

  def index
    @items = Item.all.order(created_at: :asc)
  end

  def update
    @current_item.update(items_params)

    redirect_to admin_items_path
  end

  def create
    item = Item.new(items_params)

    if item.save
      redirect_to admin_items_path
    end
  end
  
  def new
    @item = Item.new
  end

  def edit
    
  end

  def destroy
    if @current_item.destroy
      redirect_to admin_items_path
    end
  end
  
  private def auth_user
    if !user_signed_in? || current_user.role != "admin"
      redirect_to root_path
    end
  end

  private def items_params
    params.require(:item).permit(:name, :description, :price)
  end

  private def set_items
    @current_item = Item.find(params[:id])
  end
end
