namespace :invite_queue do
  desc "TODO"
  task inviteall: :environment do
    creator = nil
    InviteRequest.order(:id).each do |request|
      request.invite_and_remove(creator)
    end
  end
end
