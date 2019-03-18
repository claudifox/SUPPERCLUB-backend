class SuppersController < ApplicationController
  before_action :find_supper, only: [:update, :delete]

  def index
    @suppers = Supper.where(user_id: params[:user_id])
    render json: @suppers
  end

  def create
  @supper = Supper.new(name: params[:name], description: params[:description], date: params[:date], time: params[:time], picture: params[:picture], address: params[:address], latLng: params[:latLng], user_id: params[:user_id])
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
    params.permit(:name, :description, :date, :time, :picture, :address, :latLng, :user_id)
  end

  def find_supper
    @supper = Supper.find_by(name: params[:name], user_id: params[:user_id])
  end

end
