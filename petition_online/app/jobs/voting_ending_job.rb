class VotingEndingJob < ActiveJob::Base
  queue_as :default

  def perform
    # Do something later
    petitions = Petition.where('created_at < ?', Petition::ACTIVE_PETITION_DAYS.days.ago)
    unless petitions.empty?
      petitions.each do |petition|
        if petition.votes.count == Petition::VOTES_TO_WIN
          AdminMailer.review_user_petition(petition).deliver_later
          UserMailer.will_review(petition).deliver_later
        else
          UserMailer.not_review(petition).deliver_later
        end
    end
  end
end
