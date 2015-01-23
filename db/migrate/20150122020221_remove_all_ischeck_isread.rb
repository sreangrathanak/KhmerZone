class RemoveAllIscheckIsread < ActiveRecord::Migration
  def change
    remove_column :relationships,:ischeck
    remove_column :relationships,:isview

    remove_column :product_likes,:ischeck
    remove_column :product_likes,:isview

    remove_column :product_rates,:ischeck
    remove_column :product_rates,:isview

    remove_column :product_comments,:ischeck
    remove_column :product_comments,:isview
    
  end
end
