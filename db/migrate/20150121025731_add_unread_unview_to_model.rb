class AddUnreadUnviewToModel < ActiveRecord::Migration
  def change    
    add_column :product_likes,:ischeck, :boolean,default:false
    add_column :product_likes,:isview, :boolean,default:false

    add_column :product_rates,:ischeck, :boolean,default:false
    add_column :product_rates,:isview, :boolean,default:false

    add_column :product_comments,:ischeck, :boolean,default:false
    add_column :product_comments,:isview, :boolean,default:false
  end
end
