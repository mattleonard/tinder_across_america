namespace :tinder do
  task :like_all => :environment do
    c = Tinder.login
    Tinder.cycle_locations(c)
  end
end