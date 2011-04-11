class CreateProductlikes < ActiveRecord::Migration
  def self.up
    create_table :productlikes do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :rating1
      t.integer :rating2
      t.integer :rating3
      t.integer :rating4
      t.integer :rating5
      t.timestamps
    end
   add_index :productlikes, :product_id
   add_index :productlikes, :user_id
  end

  def self.down
    drop_table :productlikes
  end
end
