class RemoveUseridCoverAddUserImage < ActiveRecord::Migration
  def change
     remove_column :images,:user_id
     remove_column :users,:cover
     create_table :user_covers do |t|
      t.integer :user_id
      t.integer :image_id
      t.timestamps
    end
  end
end
