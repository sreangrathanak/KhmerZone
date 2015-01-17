class RemoveCommentIndexInProductComments < ActiveRecord::Migration
  def change    
    remove_index :product_comments, [:user_id, :product_id]
  end
end
