class RemoveCategoryIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users,:category_id
  end
end
