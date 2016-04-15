class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
  end
  
  def show
     @user = User.find(params[:id])
  end

  # Only users and admins can update user's profile
  def update
    if current_user.update_attributes(user_params)
      redirect_to edit_user_registration_path
    end
  end

  private
    # Using a private method to encapsulate the permissable parameters

    # Finds the User with the ID stored in the session with the key 
    # :current_user_id. Logging in sets the session value and logging
    # out removes it.

    def user_params
      params.require(:user).permit(:section, :category, :post)
    end
end

