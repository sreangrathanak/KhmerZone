class MainCategory < ActiveRecord::Base
  has_many :main_sub_categories, dependent: :destroy
  has_many :categories,:through => :main_sub_categories
end
