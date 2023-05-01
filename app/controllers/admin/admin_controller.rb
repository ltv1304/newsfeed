class Admin::AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :check_policy

    def check_policy
        if !current_user.profile.admin?
            flash[:warning] = 'У Вас нет прав на совершаемое действие. Обратитесь к администратору'
            redirect_to root_path
        end
    end

end