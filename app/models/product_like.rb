class ProductLike < ActiveRecord::Base
  belongs_to  :product
  belongs_to  :user
  validates :user_id, presence: true
  validates :product_id,presence: true
  after_create :add_user_notify

  private
    def add_user_notify
      if product.user != user
        Notification.create notifier_id:user.id,notified_id:product.id,
                        information:"like"
      end
    end
end
