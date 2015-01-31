class RemoveDefaultUserUrlFromUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :url_name, nil
  end
end
