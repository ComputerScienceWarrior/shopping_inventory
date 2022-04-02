class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  def destroy
    @user.destroy_all
    redirect_to root_path
  end

  private 

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.(:user).permit(:first_name, :username, :email, :password)
  end
end
