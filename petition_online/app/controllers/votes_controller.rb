class VotesController < ApplicationController
  def create
    @petition = Petition.find(params[:petition_id])
 
    if @petition.user_id != current_user.id
      @vote = @petition.votes.create(vote_params)
      @vote[:user_id] = @petition.user_id 
      if @vote.save
          flash[:notice] = 'Спасибо за ваш голос'
          redirect_to @petition
        else
          flash[:error] = 'Вы уже голосовали'
          redirect_to @petition
        end
    else
      # flash[:notice] = 'Вы не можете голосовать'
      redirect_to @petition
    end
  end
private
  def vote_params
    params.permit(:petition_id, :user_id)
    # .merge(user_id: current_user.id)
  end
end
