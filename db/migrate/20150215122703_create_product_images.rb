class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :path
      t.integer :user_id
      t.timestamps
    end
  end
end
