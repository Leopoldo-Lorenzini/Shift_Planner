class HomeController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    redirect_to login_path, alert: 'Debes iniciar sesión para acceder a esta página' unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end
end
