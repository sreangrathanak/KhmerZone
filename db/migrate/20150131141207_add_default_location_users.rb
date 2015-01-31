class AddDefaultLocationUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :location_id, 1
  end
end
