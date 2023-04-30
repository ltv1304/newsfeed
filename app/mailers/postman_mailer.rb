class PostmanMailer < ApplicationMailer
    default from: 

    def daily_digest
        @digest = params[:digest]

        mail to: params[:users], subject: 'daily digest | NEWSFEED'
    end

    def weekly_digest
        @digest = params[:digest]

        mail to: params[:users], subject: 'daily digest | NEWSFEED'
    end

end
