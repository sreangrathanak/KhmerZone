class AddIndexToProductComment < ActiveRecord::Migration
  def change
    add_index :product_comments, :user_id
    add_index :product_comments, :product_id
    add_index :product_comments, [:user_id, :product_id], unique: true
  end
end
