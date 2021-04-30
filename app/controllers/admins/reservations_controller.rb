class Admins::ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to admins_admin_path(current_admin.id)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to admins_admin_path(current_admin.id)
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to admins_admin_path(current_admin.id)
    else
      render :show
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time).merge(admin_id: current_admin.id)
  end
end
