class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :url
      t.text  :about
      t.string  :phones
      t.string  :location
      t.string  :address
      t.timestamps
    end
  end
end
