class ProductLike < ActiveRecord::Base
  belongs_to  :product
  belongs_to  :user
  validates :user_id, presence: true
  validates :product_id,presence: true

  
  # Returns a user's status feed.
end
