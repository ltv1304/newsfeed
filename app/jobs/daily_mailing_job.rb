class DailyMailingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    digest = Report.where(created_at: (Time.now.midnight - 1.day)..)
    users_list = User.joins(:profile).where(profile: {role: 'user', mailing_period: 'daily'}).map(&:email)
    PostmanMailer.with(users: users_list, digest: digest).daily_digest.deliver_now
  end
end
