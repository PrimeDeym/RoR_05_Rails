class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Вы вошли'
      redirect_to root_url
    else
      flash[:notice] = 'Пароль или логин не подходят'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Вы вышли'
    redirect_to root_url
  end
end
