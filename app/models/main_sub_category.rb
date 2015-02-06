class MainSubCategory < ActiveRecord::Base
  belongs_to :main_category
  belongs_to  :category
end
