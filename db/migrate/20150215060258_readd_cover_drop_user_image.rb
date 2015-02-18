class ReaddCoverDropUserImage < ActiveRecord::Migration
  def change
    drop_table :user_covers
    add_column :images,:user_id, :integer
  end
end
