class CreateProductComments < ActiveRecord::Migration
  def change
    create_table :product_comments do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :content

      t.timestamps
    end
  end
end
