class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :tinder_id
      t.boolean :liked, default: false
      t.string  :name
      t.text    :bio
      t.integer :gender
      t.datetime :birth_date
      t.datetime :last_login

      t.timestamps
    end
  end
end
