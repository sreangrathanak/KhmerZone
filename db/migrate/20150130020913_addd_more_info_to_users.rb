class AdddMoreInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users,:store_name, :string
    add_column :users,:url_name, :string, :default => :name
    add_column :users,:phone, :string
    add_column :users,:address, :string
    add_column :users,:location, :string
    add_column :users,:about, :text
    add_column :users,:isadmin, :boolean, :default => false    
    add_column :users,:category_id, :integer
  end
end
