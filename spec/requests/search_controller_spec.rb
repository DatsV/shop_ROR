require 'rails_helper'

RSpec.describe "SearchControllers", type: :request do
 
  let! (:item) { FactoryBot.create(:item) } 
  
  describe "GET search#index" do

    it "finds a searched item by name" do
      @result = Item.where('name ILIKE ?', "%#{item[:name]}%" )
      expect(@result).to eq([item])
    end

    it "return items with search params" do
      get search_index_path, params: { query: "#{item[:name]}" }
      expect(response).to render_template("index")
    end
  end
end
