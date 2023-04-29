class Profile < ApplicationRecord
    validates :name, presence: true
    belongs_to :user
    enum role: [:user, :editor, :admin]
    enum mailing_period: [:daily, :weekly, :cancel]    
end
