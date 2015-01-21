class AddRemoveUserRatingProduct < ActiveRecord::Migration
  def change    
    change_column_default :product_rates, :rate, 0
  end
end
