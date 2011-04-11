class CreateMaingroups < ActiveRecord::Migration
  def self.up
    create_table :maingroups do |t|
      t.string :maingroup
      t.string :maingroupimage
      t.timestamps
    end
  end

  def self.down
    drop_table :maingroups
  end
end
