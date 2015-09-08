namespace :todo do
  desc "list-off autodeletion after 7 days task"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
