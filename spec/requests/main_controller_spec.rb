require 'rails_helper'

RSpec.describe "MainController", type: :request do
  
  let! (:items) { FactoryBot.create_list(:item, 5) } 
  
  describe "GET main#index" do
    it "return items" do

      get root_path

      expect(response).to render_template("index")
      
      expect(Item.last(5)).to match_array(items)

    end
  end
end
