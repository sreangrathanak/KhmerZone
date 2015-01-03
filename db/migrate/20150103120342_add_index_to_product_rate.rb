class AddIndexToProductRate < ActiveRecord::Migration
  def change
    add_index :product_rates, :user_id
    add_index :product_rates, :product_id
    add_index :product_rates, [:user_id, :product_id], unique: true
  end
end
