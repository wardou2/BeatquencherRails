class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]
  before_action :set_token, only: [:findUser]

  def show
    render json: @user
  end

  def index
    @users = User.all
    render json: @users
  end

  def update
    @user.update(user_params)
    if @user.save
     render json: @user, status: :accepted
    else
     render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @user.destroy
    render json: @user
  end

  def findUser
    @user = User.find_by(email: params["email"])
    @user.google_token = @token
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :email, :google_token, :google_refresh_token)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
