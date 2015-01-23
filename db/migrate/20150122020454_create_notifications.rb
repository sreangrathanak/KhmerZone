class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :product_id
      t.integer :notifier_id
      t.string  :infomation
      t.boolean :ischeck, default: false
      t.boolean :isread, default: false
      t.timestamps
    end
    add_index :notifications, :product_id
    add_index :notifications, :notifier_id
  end
end
