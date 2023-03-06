class SearchController < ApplicationController

  def index 

    @items = item_search
    @search_value = search_params[:query]
    
  end

  private def item_search
    search_text = ['%', search_params[:query].strip, '%'].join
    @products = Item.where('name ILIKE ?', search_text )
  end

  private def search_params
    params.permit(:query)
  end
  

end
