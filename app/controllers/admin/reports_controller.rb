class Admin::ReportsController < Admin::AdminController

  before_action :set_post, only: :destroy

  def destroy
  #   users_list = User.joins(:profile).where(profile: {role: 'user', mailing_period: 'daily'}).map(&:email)
  #   PostmanMailer.with(users: users_list).daily_digest.deliver_later
    @report.destroy
    flash[:info] = "Новость удалена"
    redirect_to reports_path
  end
  
  private

  def set_post
    @report = Report.find(params[:id])
  end
   
end
