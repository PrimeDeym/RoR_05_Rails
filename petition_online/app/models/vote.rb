class Vote < ActiveRecord::Base
  belongs_to :petition
  validates :user_id, :petition_id, uniqueness: {scope: :user_id, scope: :petition_id}
end
