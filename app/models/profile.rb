class Profile < ApplicationRecord
    validates :name, presence: true
    belongs_to :user
    enum role: [:user, :editor, :admin]
    enum mailing_period: [:daily, :weekly, :cancel] 
    
    def self.role_attributes_for_select
        roles.map do |role, _|
            [I18n.t("activerecord.attributes.#{model_name.i18n_key}.roles.#{role}"), role]
        end
    end
    
    def self.mailing_period_attributes_for_select
        mailing_periods.map do |mailing_period, _|
            [I18n.t("activerecord.attributes.#{model_name.i18n_key}.mailing_periods.#{mailing_period}"), mailing_period]
        end
    end
end
