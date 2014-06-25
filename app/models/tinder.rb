require 'pyro'

class Tinder
  def self.login
    api_keys = Sekrets.settings_for(Rails.root.join('sekrets', 'ciphertext'))
    @pyro = TinderPyro::Client.new
    @pyro.sign_in(api_keys['facebook_id'], api_keys['facebook_token'])
    @pyro
  end

  def self.like_and_load(client, location)
    results = client.get_nearby_users["results"]

    if results
      Tinder.load_users_into_db(client, results, location)
      Tinder.like_users(client)
      return true
    else
      return false
    end
  end

  def self.load_users_into_db(client, results, location)
    p "------- Location #{location.address} --------------"
    results.each do |res|
      p "-- Liking #{res['name']}"
      User.create(
        tinder_id: res['_id'],
        name: res['name'],
        bio: res['bio'],
        gender: res['gender'],
        birth_date: res['birth_date'],
        last_login: res['last_login'],
        location: location
      )
    end
  end

  def self.like_users(client)
    User.unliked.each do |u|
      client.like(u.tinder_id)
      u.update(liked: true)
    end
  end

  def self.like_location(location_id)
    location = Location.find(location_id)
    client = Tinder.login
    client.update_location(location.longitude, location.latitude)
    more_to_like = true
    while more_to_like
      more_to_like = Tinder.like_and_load(client, location)
    end
  end

  def self.schedule_jobs
    # Cycles through all locations in the database.
    Location.all.each_with_index do |l,i|
      p "Scheduling #{l.address}"
      Job.schedule((i.hours * 3), Tinder, :like_location, l.id)
    end
  end
end