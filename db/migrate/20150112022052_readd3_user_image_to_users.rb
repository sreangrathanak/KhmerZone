class Readd3UserImageToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :image
    add_column :users,:image, :string
  end
end
