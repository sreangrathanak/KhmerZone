class RemoveProductIdInNotifications < ActiveRecord::Migration
  def change
    remove_index :notifications,:product_id
    rename_column :notifications, :product_id, :notified_id
    add_index :notifications, :notified_id
  end
end
