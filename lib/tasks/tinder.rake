namespace :tinder do
  task :like_all => :environment do
    Tinder.cycle_locations
  end
end