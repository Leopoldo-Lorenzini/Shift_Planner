class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail: params[:mail])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_signed_in] = true 
      redirect_to root_path, notice: "Inicio de sesión exitoso"
    else
      flash.now[:alert] = "Credenciales inválidas"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_signed_in] = false
    redirect_to root_path, notice: "Cierre de sesión exitoso"
  end
end