class RemoveProductType < ActiveRecord::Migration
  def change
    remove_column :categories, :product_type
    add_column :categories, :name, :string
  end
end
