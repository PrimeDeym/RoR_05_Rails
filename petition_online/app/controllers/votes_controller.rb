class VotesController < ApplicationController
  before_filter :authorize

  def create
      vote = current_user.votes.create(vote_params)
      if vote.save 
        flash[:notice] = 'Спасибо за ваш голос!'
        redirect_to vote.petition
      end
  end

private
  def vote_params
    params.permit(:petition_id)
  end
end
