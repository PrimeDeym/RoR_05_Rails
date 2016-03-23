class Vote < ActiveRecord::Base
  belongs_to :petition
  belongs_to :user
  # validates :petition_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :petition_id }
  validate :no_valid_petition, on: :create
  

private
  def no_valid_petition
    petition = Petition.find(petition_id)
    petition.votes_to_win
  end
end
