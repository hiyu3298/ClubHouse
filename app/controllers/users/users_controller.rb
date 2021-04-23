class Users::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render :exit
    end
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
