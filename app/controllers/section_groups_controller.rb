class SectionGroupsController < ApplicationController
    before_action :require_login
    before_action :set_section_group, only: [:show, :edit, :update, :destroy]
  
    def index
      @section_groups = SectionGroup.all
    end
  
    def show
    end
  
    def new
      @section_group = SectionGroup.new
    end
  
    def create
      @section_group = SectionGroup.new(section_group_params)
      @section_group.user = current_user
  
      if @section_group.save
        redirect_to @section_group, notice: 'Viaje creado exitosamente.'
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
  
    def section_group_params
      params.require(:section_group).permit(:n_seats, :cost, :h_start, :h_end, :starting_place_id, :ending_place_id)
    end
  
    def current_user
      @current_user ||= User.find(session[:user_id])
    end
  end
  