class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :productname
      t.string :productimage
      t.integer :subgroup_id
      t.integer :user_id
      t.text :details
      t.string :flipprice
      t.string :fliplink
      t.string :amazonprice
      t.string :amazonlink
      t.string :ebayprice
      t.string :ebaylink
      t.timestamps
    end
    add_index :products, :user_id
  end

  def self.down
    drop_table :products
  end
end
