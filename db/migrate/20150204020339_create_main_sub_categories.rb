class CreateMainSubCategories < ActiveRecord::Migration
  def change
    create_table :main_sub_categories do |t|
      t.integer :main_category_id
      t.integer :category_id
      t.timestamps
    end
  end
end
