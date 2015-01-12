class RemoveCategoryType < ActiveRecord::Migration
  def change
    remove_column :categories, :type
    add_column :categories, :product_type, :string
  end
end
