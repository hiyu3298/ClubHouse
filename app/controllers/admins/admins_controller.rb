class Admins::AdminsController < ApplicationController
  def show
    @admin = current_admin
  end

  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin
    if @admin.update(admin_params)
      redirect_to admins_admin_path
    else
      render :exit
    end
  end

  def admin_params
    params.require(:admin).permit(:team_name, :address, :genre)
  end
end
