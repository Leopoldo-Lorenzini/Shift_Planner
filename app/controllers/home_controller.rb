class HomeController < ApplicationController
  before_action :require_login
  helper_method :filter_groups  

  def index
    @user = current_user
    @itineraries = @user ? @user.itineraries : []
  end

  def viajes
    @user = current_user
    @pilot_trips = SectionGroup.where(user_id: @user.id) || []
    @passenger_trips = SectionGroup.joins(:memberships).where(memberships: { user_id: @user.id }) || []
  end

  def global
    @user = current_user
    @mode = params[:mode] || 'llegada'
    @active_itineraries = @user.itineraries.where(is_active: true)
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

  def filter_groups(itinerary, mode)
    if mode == 'llegada'
      SectionGroup.where(h_end: itinerary.h_end, day: itinerary.day)
    else
      SectionGroup.where(h_start: itinerary.h_start, day: itinerary.day)
    end
  end
end