class Editor::ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update]
  before_action :check_policy

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = Report.new post_params
    if @report.save
      flash[:success] = "Новость создана"
      redirect_to reports_path
    else
      flash.now[:danger] = 'Новость не создана'
      render :new
    end
  end

  def update
    @report.editions_count += 1
    @report.attributes = post_params
    if @report.save context: current_user.profile.editor? ? :editor : nil
      flash[:success] = "Новость обновлена"
      redirect_to reports_path
    else
      @report.editions_count -= 1
      flash.now[:danger] = 'Новость не изменена'
      render :edit
    end
  end

  private

  def set_post
    @report = Report.find(params[:id])
  end

  def post_params
    params.require(:report).permit(:title, :content)
  end

  def check_policy
    if !current_user.profile.editor?
        flash[:warning] = 'У Вас нет прав на совершаемое действие. Обратитесь к администратору'
        redirect_to root_path
    end
  end
end
