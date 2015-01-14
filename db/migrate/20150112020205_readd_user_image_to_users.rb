class ReaddUserImageToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :image
    add_column :users,:image, :string,:default=>"profile_default.png"
  end
end
