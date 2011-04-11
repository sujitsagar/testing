class CreateMerchantlikes < ActiveRecord::Migration
  def self.up
    create_table :merchantlikes do |t|
      t.integer :merchant_id
      t.integer :user_id
      t.integer :rating1
      t.integer :rating2
      t.integer :rating3
      t.integer :rating4
      t.integer :rating5
      t.timestamps
    end
   add_index :merchantlikes, :merchant_id
   add_index :merchantlikes, :user_id
  end

  def self.down
    drop_table :merchantlikes
  end
end
