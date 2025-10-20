class Api::V1::UsersController < ApplicationController
  
  # GET /api/v1/users
  def index
    @users = User.all
    render json: @users
  end

  # GET /api/v1/users/1
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Güvenlik için 'Strong Parameters'
  def user_params
    # Gelen JSON'da bir 'user' objesi bekler ve sadece bunlara izin verir:
    params.require(:user).permit(:username, :email)
  end
end