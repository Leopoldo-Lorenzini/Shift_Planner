class HomeController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    if @user
      @itineraries = @user.itineraries
    else
      @itineraries = []
    end
  end

  def viajes
    @user = current_user
    @pilot_trips = SectionGroup.where(user_id: @user.id) || []
    @passenger_trips = SectionGroup.joins(:memberships).where(memberships: { user_id: @user.id }) || []
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to login_path, alert: 'Debes iniciar sesión para acceder a esta página'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

end
