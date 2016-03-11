class Petition < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  validates :user_id, presence: true
  default_scope { order(:created_at => :desc) }

  def created_at_new
    created_at.strftime('%d/%m/%Y %H:%M')
  end

end
