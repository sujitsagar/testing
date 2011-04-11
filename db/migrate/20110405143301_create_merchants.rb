class CreateMerchants < ActiveRecord::Migration
  def self.up
    create_table :merchants do |t|
      t.string :merchantname
      t.string :merchantimage
      t.string :menulink
      t.text :tribecomment
      t.text :merachantinfo
      t.string :merspectext
      t.string :merspecimage
      t.string :meroffertext
      t.string :merofferimage
      t.text :meraddress
      t.text :merchantphone
      t.string :merextra1
      t.string :merextra2

      t.timestamps
    end
  end

  def self.down
    drop_table :merchants
  end
end
