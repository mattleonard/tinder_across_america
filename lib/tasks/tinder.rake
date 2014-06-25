namespace :tinder do
  task :like_all => :environment do
    Tinder.schedule_jobs
  end
end