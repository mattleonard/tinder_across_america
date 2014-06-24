class User < ActiveRecord::Base
  belongs_to :location

  scope :unliked, -> { where(liked: false) }

  after_save :populate_age

  def populate_age
    self.update_column(:age, (Time.now - self.birth_date)/1.year)
  end
end
