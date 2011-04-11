class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
  #add_index :users, :city_id
  def self.down
    drop_table :users
  end
end
