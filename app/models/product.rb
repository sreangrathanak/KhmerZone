class Product < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  validates_presence_of :price
  validates :name, presence: true, length: { maximum: 250 }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validate  :picture_size

   private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
