class PetitionsController < ApplicationController
  def index
    @petitions = Petition.all
  end
  
  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)
    if @petition.save
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
      redirect_to @petition
    else
      render 'edit'
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy

    redirect_to petitions_path
  end

  private 
  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end
