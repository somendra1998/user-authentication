class Api::UsersController < ApplicationController

  include JsonWebTokenValidation::UserTokenValidation
  skip_before_action :validate_json_web_token, only: [:create]
  before_action :set_user, only: [:update, :show, :destroy]

  def index
    users = User.all
    if users.present?
      render json: users, status: :ok
    else
      render json: {message: "No users found"}, status: :ok
    end
  end

  def show
    render json: @user, status: :ok
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: {errors: user.errors.full_messsages}, status: 400
    end
  end

  def update
    binding.pry
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: {errors: @user.errors.full_messsages}, status: 400
    end
  end

  private

  def user_params
    params.require(:data).permit(:name, :user_name, :email, :password)
  end

  def set_user
    begin
      @user = User.find(@token["id"])
    rescue => exception
      render json: {message:"No user found"}, status: :not_found
    end
  end

end
