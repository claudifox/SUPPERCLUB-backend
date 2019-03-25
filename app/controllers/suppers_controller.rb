class SuppersController < ApplicationController
  before_action :find_supper, only: [:update, :delete]

  def index
    # @user = get_current_user
    @suppers = Supper.all
    render json: @suppers
  end

  def create_new_supper
  @supper = Supper.new(name: params[:name], description: params[:description], date: params[:date], time: params[:time], picture: params[:picture], address: params[:address], lat: params[:lat], lng: params[:lng], user_id: params[:user_id])
    if @supper.save
      render json: @supper
    else
      render json: {error: "Unable to create supper"}, status: 400
    end
  end

  def update
    if @supper.update_attributes(supper_params)
      flash[:success] = "Supper updated"
      render json: @supper
    else
      render json: {error: "Unable to edit supper"}, status: 400
    end
  end

  def delete
    @supper.destroy
  end

private

  def supper_params
    params.permit(:name, :description, :date, :time, :picture, :address, :lat, :lng, :user_id)
  end

  def find_supper
    @user = get_current_user
    @supper = Supper.find_by(name: params[:name], user_id: params[@user.user_id])
  end

end
