class AddAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :float
  end
end
