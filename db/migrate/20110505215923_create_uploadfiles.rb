class CreateUploadfiles < ActiveRecord::Migration
  def self.up
    create_table :uploadfiles do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :uploadfiles
  end
end
