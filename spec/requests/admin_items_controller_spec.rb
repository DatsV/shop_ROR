require 'rails_helper'
require 'shared_contexts'

RSpec.describe "AdminItemsControllers", type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"
 
  let! (:admin) { FactoryBot.create(:admin_user) } 
  let! (:items) { FactoryBot.create_list(:item, 5) } 
  
  describe "GET admin_items#index" do

    it "access denied" do
      get admin_items_path
      expect(response).to redirect_to(root_path)
    end

    
    it "return items" do
      sign_in(admin)

      get admin_items_path

      expect(response).to render_template("index")
      
      expect(Item.last(5)).to match_array(items)

    end
  end

  describe "PATCH admin_items#update" do

    let(:items_params) do
       {
          name: 'new name',
          description: 'new description',
          price: 1.2
        }
    end

    it "should update an existing item" do
      sign_in(admin)
     
      item = items.last
      item.update(items_params)
     
      expect(item.reload.name).to eq "new name"
      expect(item.reload.description).to eq "new description"
      expect(item.reload.price).to eq 1.2
    end
  end

  describe "DELETE admin_items#destroy" do
    it "delete item" do
      sign_in(admin)

      expect { items.last.destroy }.to change { Item.count }.by(-1)
    end
  end
end
