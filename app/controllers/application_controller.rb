class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :authorize!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

    def authorize!
      permission = Permission.new(current_user, params[:controller], params[:action])
      raise ActionController::RoutingError.new('Not Found') unless permission.authorized?
    end

end
