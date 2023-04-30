class ReportsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @reports = Report.all
  end

  def show
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = Report.new post_params
    if @report.save
      flash[:success] = "Новость создана"
      redirect_to action: "index"
    else
      flash.now[:danger] = 'Новость не создана'
      render :new
    end
  end

  def update
    @report.editions_count += 1
    @report.attributes = post_params
    if @report.save context: current_user.profile.role == 'editor' ? :editor : nil
      flash[:success] = "Новость обновлена"
      redirect_to action: "index"
    else
      flash.now[:danger] = 'Новость не изменена'
      render :edit
    end
  end

  def destroy
    users_list = User.joins(:profile).where(profile: {role: 'user', mailing_period: 'daily'}).map(&:email)
    PostmanMailer.with(users: users_list).daily_digest.deliver_later
    @report.destroy
    flash[:info] = "Новость удалена"
    redirect_to reports_path
  end

  private

  def set_post
    @report = Report.find(params[:id])
  end

  def post_params
    params.require(:report).permit(:title, :content)
  end
end
