class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def require_user
    redirect_to login_path unless current_user
  end

  helper_method :current_user, :not_found
end
