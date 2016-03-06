class Petition < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, :text, presence: true,
                    length: { minimum: 5 }
end
