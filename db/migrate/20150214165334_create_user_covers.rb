class CreateUserCovers < ActiveRecord::Migration
  def change
    create_table :user_covers do |t|
      t.integer :user_id
      t.integer :image_id
      t.timestamps
    end
  end
end
