class PostmanMailer < ApplicationMailer
    default from: 

    def daily_digest
        mail to: params[:users], subject: 'daily digest | NEWSFEED'
    end
end
