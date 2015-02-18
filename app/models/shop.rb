class Shop < ActiveRecord::Base
  has_many :user_shops
  has_many  :users, :through => :user_shops
end
