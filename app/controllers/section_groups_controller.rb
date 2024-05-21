class SectionGroupsController < ApplicationController
    before_action :require_login
    before_action :set_section_group, only: [:show, :edit, :update, :destroy]
    before_action :set_itinerary, only: [:new, :create]
  
    def index
      @section_groups = SectionGroup.all
    end
  
    def show
    end
  
    def new
      @section_group = SectionGroup.new
      if @itinerary
        @section_group.h_start = @itinerary.h_start
        @section_group.h_end = @itinerary.h_end
        @section_group.starting_place_id = @itinerary.starting_place_id
        @section_group.ending_place_id = @itinerary.ending_place_id
        @section_group.day = @itinerary.day
      end
    end
  
    def create
      @section_group = SectionGroup.new(section_group_params)
      @section_group.user_id = current_user.id
  
      if @itinerary
        @section_group.h_start = @itinerary.h_start
        @section_group.h_end = @itinerary.h_end
        @section_group.starting_place_id = @itinerary.starting_place_id
        @section_group.ending_place_id = @itinerary.ending_place_id
        @section_group.day = @itinerary.day
      end
  
      if @section_group.save
        redirect_to viaje_path
        flash[:notice] = 'Viaje creado exitosamente.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @section_group.update(section_group_params)
        redirect_to @section_group, notice: 'Viaje actualizado exitosamente.'
      else
        render :edit
      end
    end
  
    def destroy
      @section_group.destroy
      redirect_to section_groups_url, notice: 'Viaje eliminado exitosamente.'
    end
  
    private
  
    def set_section_group
      @section_group = SectionGroup.find(params[:id])
    end
  
    def set_itinerary
      @itinerary = Itinerary.find_by(id: params[:itinerary_id])
    end
  
    def section_group_params
        params.require(:section_group).permit(:n_seats, :cost, :h_start, :h_end, :day, :starting_place_id, :ending_place_id,:user)
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
  