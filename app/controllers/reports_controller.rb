class ReportsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  
  def index
    @reports = Report.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
    @report.editions_count += 1
    if @report.update post_params
      redirect_to action: "index"
    else
      # flash.now[:danger] = 'Статья не обновлена'
      render :edit
    end
  end

  def destroy
  end

  private

  def set_post
    @report = Report.find(params[:id])
  end

  def post_params
    params.require(:report).permit(:title, :content)
  end
end
