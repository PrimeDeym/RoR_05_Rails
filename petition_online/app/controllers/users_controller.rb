class UsersController < ApplicationController
  
  def index
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
      flash[:notice] = 'Новый пользователь был создан'
    else
      render 'new'
    end
  end

  def show
    
  end

  private
  def users_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
