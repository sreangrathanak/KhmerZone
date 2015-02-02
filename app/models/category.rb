class Category < ActiveRecord::Base
  has_many :product_categories, dependent: :destroy
  has_many :products,:through => :product_categories

  has_many :user_categories , dependent: :destroy
  has_many  :users, :through => :user_categories
end
