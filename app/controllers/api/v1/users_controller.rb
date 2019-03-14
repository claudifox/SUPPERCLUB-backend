class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :delete]

  def index
    @users = User.all
    render json: @users
  end

  def login
    @user = User.find_by(email_address: params[:email_address])
    if @user && @user.authenticate(params[:password])
      render json: {email_address: @user.email_address, token: issue_token({id: @user.id}), user_id: @user.id}
    else
      render json: {error: "Your email address or password is incorrect"}, status: 401
    end
  end

  def validate
    @user = get_current_user
    if @user
      render json: {email_address: @user.email_address, token: issue_token({id: @user.id}), first_name: @user.first_name, last_name: @user.last_name, user_id: @user.id}
    else
      render json: {error: "Your email address or password is incorrect"}, status: 401
    end
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
    if @user.update_attributes(user_params)
      flash[:success] = "User updated"
      render json: @user
    else
      render json: {error: "Unable to edit user"}, status: 400
    end
  end

  def delete
    @user.destroy
  end


private

  def user_params
    params.permit(:first_name, :last_name, :email_address, :date_of_birth, :profile_picture, :description)
  end

  def find_user
    @user = User.find_by(email_address: params[:email_address])
  end

end
