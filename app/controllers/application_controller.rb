class ApplicationController < ActionController::Base
    before_action :require_login

    helper_method :current_user, :logged_in?


    private
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def require_login
      redirect_to login_path if !logged_in?
    end

end
