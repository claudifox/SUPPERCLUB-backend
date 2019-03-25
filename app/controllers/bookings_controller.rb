class BookingsController < ApplicationController
  before_action :find_booking, only: [:update, :delete]

  def index
    @user = get_current_user
    user_id = @user.user_id
    @bookings = Booking.where(user_id: params[:user_id])
    render json: @bookings
  end

  def create_attended_supper
    @booking = Booking.new(user_id: params[:user_id], supper_id: params[:supper_id])
    if @booking.save
      render json: @booking
    else
      render json: {error: "Unable to add supper to booking"}, status: 400
    end
  end

  def update
    if @booking.update_attributes(booking_params)
      flash[:success] = "Booking updated"
      render json: @booking
    else
      render json: {error: "Unable to edit booking"}, status: 400
    end
  end

  def delete
    @booking.destroy
  end

  private

  def booking_params
    @user = get_current_user
    params.permit(@user.user_id, :supper_id)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

end
