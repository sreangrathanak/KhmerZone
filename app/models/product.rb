class Product < ActiveRecord::Base   
  belongs_to :user
  
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images,:allow_destroy => true

  has_many :product_categories, dependent: :destroy
  has_many :categories,:through => :product_categories

  has_many :notifications, class_name:  "Notification",
                                  foreign_key: "notified_id", 
                                  dependent: :destroy
  has_many :product_comments, dependent: :destroy
  has_many :product_likes, dependent: :destroy
  has_many :likers, through: :product_likes, source: :user
  has_many :product_rates
  has_many :raters, :through => :product_rates, :source => :users
  validates_presence_of :price
  validates :name, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
  default_scope -> { order(updated_at: :desc) }

  def avg_rating
    average_rating = 0.0
    count = 0
    product_rates.each do |rating| 
      average_rating += rating.rate
      count += 1
    end
                  
    if count != 0
      (average_rating / count)
    else
      count
    end
  end

  # Returns true if the current user is liking the product.
  def user_liking?(user)
    self.likers.include?(user)
  end

  scope :search, ->(search) {
    if search
      where("name like ?", "%#{search}%")    
    end
  }

  def self.product_advance_search(keywords,category_ids,min_price,max_price)
      products = Product.order(:name)
      products = Product.where("name like ?", "%#{keywords}%") if keywords.present?
      products = Product.where(category_id: category_ids) if category_ids.present?
      products = Product.where("price >= ?", min_price) if min_price.present?
      products = Product.where("price <= ?", max_price) if max_price.present?
      products
  end
   private

    # Validates the size of an uploaded picture.    
end
