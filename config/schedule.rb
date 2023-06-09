# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# # Learn more: http://github.com/javan/whenever
env :PATH, ENV['PATH']
env :PATH, ENV['PATH']
env :BROWSER, "/usr/bin/firefox"
env :DISPLAY, ":0"
set :output, "log/cron_log.log"
set :runner_command, "rails runner"


set :environment, "development"

every '0 7 * * 1-7' do
    runner "DailyMailingJob.new.perform"
end

every '0 7 * * 1' do
    runner "WeeklyMailingJob.new.perform"
end