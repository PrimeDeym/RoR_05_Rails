namespace :petitions do
  desc "Check old petition"
  task check_old: :environment do
    VotingEndingJob.perform_later
  end
end