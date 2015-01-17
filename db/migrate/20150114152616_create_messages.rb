class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recever_id
      t.string  :subject
      t.boolean :unread
      t.text    :content
      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :recever_id    
  end
end
