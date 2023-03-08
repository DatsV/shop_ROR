class AdminUsersController < ApplicationController
  before_action :auth_user
  before_action :set_items, only: %i[destroy]
  

  def index
    @users = User.all.order(id: :asc)
  end

  def destroy
    if @current_user.destroy
      redirect_to admin_users_path
    end
  end

  def update
    User.update(params[:id], role: 'admin')
    redirect_to admin_users_path
  end
  


  private def auth_user
    if !user_signed_in? || current_user.role != "admin"
      
      redirect_to root_path
    end
  end

  private def set_items
    @current_user = User.find(params[:id])
  end
  
  
end
