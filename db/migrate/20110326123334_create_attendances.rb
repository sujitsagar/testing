class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.integer :deal_id
      t.integer :user_id
      t.integer :status
      t.timestamps
    end
    add_index :attendances, :deal_id
    add_index :attendances, :user_id
  end

  def self.down
    drop_table :attendances
  end
end
