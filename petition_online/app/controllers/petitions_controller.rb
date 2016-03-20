class PetitionsController < ApplicationController
  
  before_filter :authorize, only: [:new, :create, :edit, :destroy]

  def index
    if params[:my]
      @petitions = current_user.petitions
    else
      @petitions = Petition.all
    end
  end
  
  def new
    @petition = Petition.new
  end

  def create
    @petition = current_user.petitions.create(petition_params)
    if @petition.save
      flash[:notice] = 'Петиция создана'
      redirect_to @petition
    else
      render 'new'
    end
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def edit
    @petition = current_user.petitions.find(params[:id])
    if @petition.expired or @petition.votes_to_win
      redirect_to petition_path
      flash[:error] = 'Вы не можете редактировать эту петицию'
    end
  end

  def update
    petition = current_user.petitions.find(params[:id])
    if petition.update(petition_params)
      flash[:notice] = "Петиция обновлена"
      redirect_to petition
    else
      render 'edit'
    end
  end

  def destroy
    petition = current_user.petitions.find(params[:id])
    petition.destroy
 
    redirect_to action: :index
    flash[:error] = "Петиция удалена"
  end

private 
  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end
