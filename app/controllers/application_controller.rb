class ApplicationController < ActionController::Base
    before_action :require_login

    private
    def not_authenticated
        redirect_to login_path
    end

    def rol_user
        if current_user.present?
            if current_user.administrator?
            else
              redirect_to root_path, alert: " Usted no tiene permiso para entrar a este sitio "
            end
        else
            
        end 
    end
end
