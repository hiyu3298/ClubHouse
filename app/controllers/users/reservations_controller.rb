class Users::ReservationsController < ApplicationController
  def edit
    @reservation = Reservation.find(params[:id])
    @admin = Admin.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(user_id: current_user.id)
      redirect_to team_path(@reservation.admin_id)
    else
      render :edit
    end
  end
end
