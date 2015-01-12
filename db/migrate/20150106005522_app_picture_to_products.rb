class AppPictureToProducts < ActiveRecord::Migration
  def change
    add_column :products, :picture, :string
  end
end
