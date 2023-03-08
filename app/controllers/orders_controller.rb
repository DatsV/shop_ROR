class OrdersController < ApplicationController
  def index
    
  end

  def create
    cart = session[:cart]

    order = Order.create(user: current_user, amount: params[:total_price])
   
    for part in cart do
      item_id = part['item']['id'].to_i
      item = Item.find(item_id)
      quantity = part['quantity']
      OrdersDescription.create(order: order, item: item, quantity: quantity)
    end

    session[:cart] = []

    redirect_to purchases_path
  end
end
