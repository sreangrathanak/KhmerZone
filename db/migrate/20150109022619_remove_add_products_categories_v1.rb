class RemoveAddProductsCategoriesV1 < ActiveRecord::Migration
  def change
    remove_column :products, :category_ids
    add_column :products, :category_id, :integer
  end
end
