class UsersController < ApplicationController

  

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :introduction)
  end
end
