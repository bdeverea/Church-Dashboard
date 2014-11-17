class UsersController < ApplicationController

  def index
    @users = User.order(:last_name)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "#{@user.name} has been successfully created!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
