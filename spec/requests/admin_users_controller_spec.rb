require 'rails_helper'
require 'shared_contexts'

RSpec.describe "AdminUsersControllers", type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"
 
  let! (:admin) { FactoryBot.create(:admin_user) } 
  let! (:users) { FactoryBot.create_list(:user, 5) } 
  
  describe "GET admin_user#index" do
    it "access denied" do

      get admin_users_path

      expect(response).to redirect_to(root_path)
      
    end

    it "return users" do
      sign_in(admin)
      
      get admin_users_path

      expect(response).to render_template("index")
      
      expect(User.last(5)).to match_array(users)

    end
  end

  describe "PATCH admin_user#update" do
    it "should update an existing role" do
      sign_in(admin)
     
      user = users.last
      user.update(role: "new role")
     
      expect(user.reload.role).to eq "new role"
    end
  end

  describe "DELETE admin_user#destroy" do
    it "delete user" do
      sign_in(admin)

      expect { users.last.destroy }.to change { User.count }.by(-1)
    end
  end
end
