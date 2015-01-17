class RemoveReciverAddDefaultToMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :recever_id
    add_column :messages,:reciver_id, :integer
    change_column_default :messages, :unread, false
    add_index :messages, :reciver_id 
  end
end
