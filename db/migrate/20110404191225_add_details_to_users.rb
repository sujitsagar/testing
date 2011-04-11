class AddDetailsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :lastname, :string
    add_column :users, :city_id, :integer
    add_column :users, :sex, :string
    add_column :users, :birthday_date, :date
    add_column :users, :profession, :string
    add_column :users, :company, :string
    add_column :users, :confirmation, :string
    add_column :users, :active, :boolean
  end

  def self.down
    remove_column :users, :profession
    remove_column :users, :birthday
    remove_column :users, :sex
    remove_column :users, :city_id
    remove_column :users, :lastname
  end
end
