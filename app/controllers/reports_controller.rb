class ReportsController < ApplicationController

  before_action :set_post, only: :show
    
  def index
    @reports = Report.all
  end

  def show
  end

  private
  
  def set_post
    @report = Report.find(params[:id])
  end
end
