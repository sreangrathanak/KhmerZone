class RemoveAddProductsCategories < ActiveRecord::Migration
  def change
    remove_column :products, :category_id
    add_column :products, :category_ids, :integer
  end
end
