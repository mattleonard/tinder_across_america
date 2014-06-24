require 'pyro'

class Tinder
  def self.login
    api_keys = Sekrets.settings_for(Rails.root.join('sekrets', 'ciphertext'))
    @pyro = TinderPyro::Client.new
    @pyro.sign_in(api_keys['facebook_id'], api_keys['facebook_token'])
    @pyro
  end

  def self.like_and_load(client)
    results = client.get_nearby_users["results"]

    if results
      Tinder.load_users_into_db(client, results)
      Tinder.like_users(client)
      Tinder.like_and_load(client)
    end
  end

  def self.load_users_into_db(client, results)
    results.each do |res|
      User.create(
        tinder_id: res['_id'],
        name: res['name'],
        bio: res['bio'],
        gender: res['gender'],
        birth_date: res['birth_date'],
        last_login: res['last_login']
      )
    end
  end

  def self.like_users(client)
    User.unliked.each do |u|
      client.like(u.tinder_id)
      u.update(liked: true)
    end
  end

  def move_location(client)
    client.update_location(latitude, longitude)
  end
end