class PetitionsController < ApplicationController
  
  before_filter :authorize, only: [:new, :create, :edit, :destroy]

  def index
    if params[:my]
      @petitions = current_user.petitions
      # render 'user_petitions'
    else
      @petitions = Petition.all
    end
  end
  
  def new
    @petition = Petition.new
  end

  def create
    @petition = current_user.petitions.build(petition_params)
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
    @petition = Petition.find(params[:id])
  end

  def update
    @petition = Petition.find(params[:id])
    if @petition.update(petition_params)
      flash[:notice] = "Петиция обновлена"
      redirect_to @petition

    else
      render 'edit'
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy

    redirect_to petitions_path(:my => true)
    flash[:notice] = "Петиция удалена"
  end

  # def user_petitions
  #   @petitions = current_user.petitions
  # end

private 
  def petition_params
    params.require(:petition).permit(:id, :title, :text)
  end
end
