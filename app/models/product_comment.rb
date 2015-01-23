class ProductComment < ActiveRecord::Base
  belongs_to  :product
  belongs_to  :user
  default_scope -> {order("updated_at ASC")}
  validates :user_id, presence: true
  validates :product_id,presence: true
  validates :content,presence: true, length:{minimum:4, maximum:200}
  after_create :add_user_notify

  private
    def add_user_notify
      if product.user != user
        Notification.create notifier_id:user.id,notified_id:product.id,
                        information:"comment"
      end
    end

end
