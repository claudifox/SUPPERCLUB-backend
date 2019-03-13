class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email_address: params[:email_address], date_of_birth: params[:date_of_birth], profile_picture: params[:profile_picture], description: params[:description])
    if @user.save
      render json: @user
    else
      render json: {error: "Unable to create user"}, status: 400
    end
  end

  def update
    @user = User.find_by(email_address: params[:email_address])
    if @user.update_attributes(user_params)
      flash[:success] = "User updated"
      render json: @user
    else
      render json: {error: "Unable to edit user"}, status: 400
    end
  end

  def delete
    @user = User.find_by(email_address: params[:email_address])
    @user.destroy
  end



private

def user_params
  params.permit(:first_name, :last_name, :email_address, :date_of_birth, :profile_picture, :description)
end

end
