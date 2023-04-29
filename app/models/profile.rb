class Profile < ApplicationRecord
    belongs_to :user
    enum role: [:user, :editor, :admin]
    enum mailing_period: [:daily, :weekly, :cancel]    
end
