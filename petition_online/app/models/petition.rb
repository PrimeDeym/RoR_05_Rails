class Petition < ActiveRecord::Base
  VOTES_TO_WIN = 100
  ACTIVE_PETITION_DAYS = 30

  validates :title, :text, presence: true
  validate :expired

  belongs_to :user
  has_many :votes

  default_scope { order(:created_at => :desc) }

  def votes_to_win
    votes.count >= VOTES_TO_WIN
  end

  def expired
    created_at < ACTIVE_PETITION_DAYS.days.ago
  end

end
