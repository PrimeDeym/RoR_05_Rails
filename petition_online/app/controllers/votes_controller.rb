class VotesController < ApplicationController
  def create
    @petition = Petition.find(params[:petition_id])   
    @vote = @petition.votes.create(vote_params)
    @vote[:user_id] = current_user.id
    if @vote.save
      flash[:notice] = 'Спасибо за ваш голос!'
      redirect_to @petition
    end  
  end

private
  def vote_params
    params.permit(:petition_id)
  end
end
