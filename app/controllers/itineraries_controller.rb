class ItinerariesController < ApplicationController
    before_action :require_login
  
    def new
      @itinerary = Itinerary.new
      @places = Place.all
    end
  
    def create
      @itinerary = Itinerary.new(itinerary_params)
      @itinerary.user = current_user
  
      if @itinerary.save
        redirect_to root_path, notice: 'Itinerario creado exitosamente.'
      else
        @places = Place.all
        render :new
      end
    end
  
    private
  
    def itinerary_params
      params.require(:itinerary).permit(:status, :day, :h_start, :h_end, :starting_place_id, :ending_place_id)
    end
  
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
  