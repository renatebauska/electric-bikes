class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all

    authorize @users
  end

  def new
    @user = User.new

    authorize @user
  end

  def create
    @user = User.new(user_params)

    authorize @user

    @user.save

    redirect_to users_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    authorize User
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])

    authorize @user
  end

  def user_params
    params.require(:user)
      .permit(:username, :email, :password, :password_confirmation, :role)
  end
end
