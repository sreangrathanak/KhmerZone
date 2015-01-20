class CreateProductLikes < ActiveRecord::Migration
  def change
    create_table :product_likes do |t|
      t.integer :user_id
      t.integer :product_id
      t.boolean :liked, default: false
      t.timestamps
    end
    add_index :product_likes, :user_id
    add_index :product_likes, :product_id
    add_index :product_likes, [:user_id, :product_id], unique: true
  end
end
