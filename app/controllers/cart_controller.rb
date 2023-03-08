class CartController < ApplicationController
  before_action :initialize_session
  before_action :init_params, only: %i[update create]
  before_action :init_id, only: %i[update create destroy]
  before_action :total_price, only: %i[index update create destroy]

  def index
    @cart = session[:cart]
    @total_price = total_price
  end
  

  def update
    change_quantity('update')
  end

  def change_quantity(method)
    p method
    for f in session[:cart] do
      if f['id'] == init_id
        f['quantity'] = init_params[:quantity]
        method == 'update' ? redirect_to('/cart', notice: "Product update") : redirect_to(root_path, notice: "Product add to cart")
        return true
      end
    end
  end
  
  

  def create 
    if change_quantity('create') == true
      return
    end

    item = Item.find(init_id)

    obj = {
      id: init_id,
      item: item,
      quantity: init_params[:quantity],
    }
    session[:cart] << obj
   
    redirect_to root_path, notice: "Product add to cart"
  end

  def destroy  
    for f in session[:cart] do
      if f['id'] == init_id
        session[:cart].delete(f)
        redirect_to '/cart', notice: "Product deleted"
        return 
      end
    end
  end
  


  def total_price
    price = 0
    for f in session[:cart] do
     price += f['item']['price'] * f['quantity'].to_i
    end
    '%.2f' % price
  end

  private

  def init_params
    params.permit(:product_id, :quantity)
  end

  def init_id
    init_params[:product_id].to_i
  end
  

  def initialize_session
    session[:cart] ||= []
  end
end
