class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Inicio de sesión exitoso"
    else
      flash.now[:alert] = "Credenciales inválidas"
      render :login
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Sesión cerrada correctamente"
  end
end
