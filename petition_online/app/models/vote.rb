class Vote < ActiveRecord::Base
  belongs_to :petition
  validates :petition_id, uniqueness: { scope: :user_id }
end
