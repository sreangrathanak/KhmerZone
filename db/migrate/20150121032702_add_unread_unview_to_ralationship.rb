class AddUnreadUnviewToRalationship < ActiveRecord::Migration
  def change
    add_column :relationships,:ischeck, :boolean,default:false
    add_column :relationships,:isview, :boolean,default:false
  end
end
