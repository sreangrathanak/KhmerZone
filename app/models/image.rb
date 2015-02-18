class Image < ActiveRecord::Base
  
  belongs_to :user

  mount_uploader :path, PictureUploader
  validate  :picture_size

  private

    def picture_size
      if path.size > 1.megabytes
        errors.add(:path, "should be less than 1MB")
      end
  end
end
