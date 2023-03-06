class PurchasesController < ApplicationController
  before_action :auth_user

  def index

    @products = Order.where(user: current_user).includes(:orders_descriptions).map do |order|
      {
        order_id: order.id,
        amount: order.amount,
        created_at: order.created_at,
        descriptions: order.orders_descriptions.includes(:item).map do |description|
          {
              description: description.id,
              item: description.item,
              quantity: description.quantity
          }
        end
      }
    end

    @products
  end

  private def auth_user
    current_user
  
  end
  
end
