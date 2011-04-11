class CreateProductcomments < ActiveRecord::Migration
  def self.up
    create_table :productcomments do |t|
      t.integer :product_id
      t.integer :user_id
      t.string :content
      t.string :type
      t.timestamps
    end
    add_index :productcomments, :product_id
    add_index :productcomments, :user_id
  end

  def self.down
    drop_table :productcomments
  end
end
