class CreateSubgroups < ActiveRecord::Migration
  def self.up
    create_table :subgroups do |t|
      t.string :subgroup
      t.integer :maingroup_id
      t.string :cate1
      t.string :cate1image
      t.string :cate2
      t.string :cate2image
      t.text :details
      t.timestamps
    end
    add_index :subgroups, :maingroup_id
  end

  def self.down
    drop_table :subgroups
  end
end
