class RemoveUserIdAddProductId < ActiveRecord::Migration
  def change
    remove_column :product_images,:user_id
    add_column :product_images,:product_id, :integer
  end
end
