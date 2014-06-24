class Location < ActiveRecord::Base
  has_many :users

  geocoded_by :address
  after_validation :geocode

  def address
    [self.city, self.state, "USA"].compact.join(', ')
  end
end
