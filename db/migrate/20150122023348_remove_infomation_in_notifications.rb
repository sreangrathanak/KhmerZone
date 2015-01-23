class RemoveInfomationInNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications,:infomation
    add_column :notifications,:information, :string
  end
end
