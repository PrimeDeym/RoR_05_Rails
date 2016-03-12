class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Добро пожаловать'
      redirect_to root_url
    else
      flash[:error] = 'Пароль или логин не подходят'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Вы вышли'
    redirect_to root_url
  end
end
