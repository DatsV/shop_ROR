class CartController < ApplicationController
  before_action :initialize_session
  # before_action :init_params, only: %i[update create]
  skip_before_action :verify_authenticity_token
  before_action :set_total_price, only: %i[index update create destroy]

  def index
    @cart = session[:cart]
    @total_price = set_total_price
  end
  

  def update
    session[:cart] = JSON.parse(params[:data])

    redirect_to("/cart", notice: "Product updated")
  end

  def create 
    session[:cart] << JSON.parse(params[:data])
    redirect_to(root_path, notice: "Product add to cart")
  end

  private

  def set_total_price
    '%.2f' % session[:cart].map {|obj| obj['price'].to_f * obj['quantity'].to_i }.sum
  end

  def initialize_session
    session[:cart] ||= []
  end
end
