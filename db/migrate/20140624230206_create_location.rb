class CreateLocation < ActiveRecord::Migration
  def change
    add_column :users, :location_id, :integer

    create_table :locations do |t|
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
    end
  end
end
