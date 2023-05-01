class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_policy, only: :show

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update post_params
      flash[:success] = "Карточка пользователя изменена"
      redirect_to action: "index"
    else
      flash.now[:danger] = "Неудалось изменить карточку пользователя"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:info] = "Карточка пользователя удалена"
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def post_params
    params.require(:user).permit(:email, profile_attributes: [:name, :role, :mailing_period])
  end

  def check_policy
    if current_user.id.to_s != params[:id]
        flash[:warning] = 'У Вас нет прав на совершаемое действие. Обратитесь к администратору'
        redirect_to root_path
    end
  end
end
