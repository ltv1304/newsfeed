class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update post_params
      redirect_to action: "index"
    else
      # flash.now[:danger] = 'Статья не обновлена'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def post_params
    params.require(:user).permit(:email, profile_attributes: [:name, :role, :mailing_period])
  end
end
